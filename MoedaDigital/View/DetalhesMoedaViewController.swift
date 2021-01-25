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
    @IBOutlet weak var adicionarButton: UIButton!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelTipo: UILabel!

    var contexto: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    var lista: MoedaViewData?

    override func viewDidLoad() {
        super.viewDidLoad()
        configura()
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        
    }
    
    func configura(){
        labelTipo.text = lista?.assetIDQuote
        guard let rate = lista?.rate else {return}
        labelRate.text = String(format: "$ %.0f%", rate)
        lastHour.text = lista?.time
        lastMonth.text = lista?.time
        lastYear.text = lista?.time
    }

    @IBAction func AddMoeda(_ sender: Any) {
        let moeda = Moeda(context: contexto)

        moeda.assetIDQuote = lista?.assetIDQuote
        moeda.rate = lista?.rate ?? 0
        moeda.time = lista?.time

        do{
            try contexto.save()
            navigationController?.popViewController(animated: true)
        }catch{
            print(error.localizedDescription)
        }
    }

}
