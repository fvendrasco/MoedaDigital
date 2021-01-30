//
//  DetalhesMoedaViewController.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 22/01/21.
//

import UIKit

class DetalhesMoedaViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var lastHour: UILabel!
    @IBOutlet weak var lastMonth: UILabel!
    @IBOutlet weak var lastDay: UILabel!
    @IBOutlet weak var buttonFavorito: UIButton!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var viewCabecalho: UIView!
    @IBOutlet weak var viewCorpoTela: UIView!
    
    //MARK: - Properts
    var viewModel: DetalhesMoedaViewModel?
    
    //MARK: - Constructor
    init(viewModel: DetalhesMoedaViewModel?) {
        self.viewModel = viewModel
        
        super.init(nibName: "DetalhesMoedaViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configura()
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        moedaFavorita()
        setupAccessibility()
        
    }

    //MARK: - Methods
    func configura(){
        if viewModel?.valorMoeda != nil {
            guard let valor = viewModel?.valorMoeda else {return}
            labelTipo.text =  valor.asset_id
            labelRate.text = valor.price_usd
            lastHour.text = valor.volume_1hrs_usd
            lastMonth.text = valor.volume_1mth_usd
            lastDay.text = valor.volume_1day_usd
        } else {
            guard let valor = viewModel?.moedaSalva else {return}
            labelTipo.text =  valor.assetId
            labelRate.text = valor.price
            lastHour.text = valor.volumeHour
            lastMonth.text = valor.volumeMonth
            lastDay.text = valor.volumeDay
        }
        
    }
    
    func moedaFavorita(){
        if viewModel?.recuperaFavorito() == true {
            labelEstrela.text = "⭐"
            buttonFavorito.setTitle("remover", for: .normal)
        }
    }
    
    // MARK: Accessibilidade
    func setupAccessibility(){
        labelRate.isAccessibilityElement = true
        labelTipo.isAccessibilityElement = true
        lastMonth.isAccessibilityElement = true
        lastHour.isAccessibilityElement = true
        buttonFavorito.isAccessibilityElement = true
        viewCabecalho.isAccessibilityElement = true
        viewCorpoTela.isAccessibilityElement = true
        viewCabecalho.accessibilityLabel = "Neste espaço está contido a imagem da moeda, sua sigla e seu valor atual e o botão para adicionar aos favoritos"
        viewCorpoTela.accessibilityLabel = "Neste espaço está contido os valores da moeda selecionada na última hora, último mês e último ano"
        buttonFavorito.setTitle("Adicionar", for: .normal)
        buttonFavorito.accessibilityLabel = "Adicionar ou Remover Favoritos"
        buttonFavorito.accessibilityHint = "Adicionar e Retirar a moeda aos Favoritos"
        
        self.accessibilityElements = [viewCabecalho!, viewCorpoTela!, buttonFavorito!]
    }

    //MARK: - IBAction
    @IBAction func estadoMoeda(_ sender: Any) {
        viewModel?.montaDicionario()
        buttonFavorito.setTitle("operação realizada", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    

}
