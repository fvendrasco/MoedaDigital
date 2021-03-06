//
//  DetalhesMoedaViewController.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 22/01/21.
//

import UIKit

class DetalhesMoedaViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var lastHour: UILabel!
    @IBOutlet weak var lastMonth: UILabel!
    @IBOutlet weak var lastDay: UILabel!
    @IBOutlet weak var buttonFavorito: UIButton!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var viewCabecalho: UIView!
    @IBOutlet weak var viewCorpo: UIView!
    @IBOutlet weak var labelHora: UILabel!
    @IBOutlet weak var labelDia: UILabel!
    @IBOutlet weak var labelAno: UILabel!
    @IBOutlet weak var labelVolume: UILabel!
    
    // MARK: - Properts
    var viewModel: DetalhesMoedaViewModel?
    // MARK: - Constructor
    init(viewModel: DetalhesMoedaViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: "DetalhesMoedaViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configura()
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        moedaFavorita()
        setupAccessibility()
        configuraLabel()
    }

    // MARK: - Methods
    func configura() {
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
    func moedaFavorita() {
        if viewModel?.recuperaFavorito() == true {
            labelEstrela.text = "⭐"
            buttonFavorito.setTitle("remover", for: .normal)
        }
    }

    // MARK: - IBAction
    @IBAction func estadoMoeda(_ sender: Any) {
        viewModel?.montaDicionario()
        buttonFavorito.setTitle("operação realizada", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationController?.popViewController(animated: true)
        }
    }


}
