////
////  DetalhesMoedaViewController.swift
////  MoedaDigital
////
////  Created by Breno Luizetto Cintra on 22/01/21.a
////
//
//import UIKit
//import CoreData
//
//class DetalhesMoedaViewController: UIViewController {
//    @IBOutlet weak var viewButton: UIView!
//    @IBOutlet weak var lastHour: UILabel!
//    @IBOutlet weak var lastMonth: UILabel!
//    @IBOutlet weak var lastYear: UILabel!
//    @IBOutlet weak var adicionarButton: UIButton!
//    @IBOutlet weak var labelRate: UILabel!
//    @IBOutlet weak var labelTipo: UILabel!
//    
//    var contexto: NSManagedObjectContext{
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//    }
//    
//    var lista: MoedaViewData
//    
//    init(lista: MoedaViewData) {
//        self.lista = lista
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configura()
//    }
//    
//    func configura(){
//        if let moeda = lista{
//            lastHour.text = moeda.time
//            lastMonth.text = moeda.time
//            lastYear.text = moeda.time
//            let rate = moeda.rate
//            labelRate.text = String(format: "$ %.0f%", rate)
//            labelTipo.text = moeda.assetIDQuote
//        }
//    }
//    
//
//    @IBAction func AddMoeda(_ sender: Any) {
//        let moeda = Moeda(context: contexto)
//        
//        moeda.assetIDQuote = lista.assetIDQuote
//        moeda.rate = lista.rate
//        moeda.time = lista.time
//        
//        do{
//            try contexto.save()
//            navigationController?.popViewController(animated: true)
//        }catch{
//            print(error.localizedDescription)
//        }
//    }
//    
//}
