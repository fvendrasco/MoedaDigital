//
//  DetalhesMoedaViewController.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 22/01/21.
//

import UIKit
import CoreData

class DetalhesMoedaViewController: UIViewController {
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var lastHour: UILabel!
    @IBOutlet weak var lastMonth: UILabel!
    @IBOutlet weak var lastYear: UILabel!
    @IBOutlet weak var buttonFavorito: UIButton!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var buttonEstrela: UIButton!

    var viewModel: DetalhesMoedaViewModel
    
    init(viewModel: DetalhesMoedaViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "DetalhesMoedaViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configura()
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        moedaFavorita()
    }

    func configura(){
        
        labelTipo.text = viewModel.valorMoeda.assetIDQuote
        labelRate.text = viewModel.valorMoeda.rate
        lastHour.text = viewModel.valorMoeda.time
        lastMonth.text = viewModel.valorMoeda.time
        lastYear.text = viewModel.valorMoeda.time
    }
    
    func moedaFavorita(){
        if viewModel.recuperaFavorito() == true {
            buttonEstrela.setTitle("⭐", for: .normal)
            buttonFavorito.setTitle("remover", for: .normal)
        }
    }

    @IBAction func AddMoeda(_ sender: Any) {
        viewModel.montaDicionario()
        self.navigationController?.popViewController(animated: true)
    }

}
