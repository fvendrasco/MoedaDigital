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

    var lista: MoedaViewData?
    var viewModel: DetalhesMoedaViewModel = DetalhesMoedaViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configura()
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        
    }
    
    func configura(){
        labelTipo.text = lista?.assetIDQuote
        labelRate.text = lista?.rate
        lastHour.text = lista?.time
        lastMonth.text = lista?.time
        lastYear.text = lista?.time
    }

    @IBAction func AddMoeda(_ sender: Any) {
        let dicionario = viewModel.montaDicionario(lista!)
        MoedaDAO().salvaMoeda(dicionarioDeMoeda: dicionario)
        self.navigationController?.popViewController(animated: true)
    }

}
