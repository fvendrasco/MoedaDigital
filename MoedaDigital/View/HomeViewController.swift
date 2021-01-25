//
//  HomeViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlet
    @IBOutlet weak var dateHomeView: UILabel!
    @IBOutlet weak var tabelaMoeda: UITableView! {
        didSet{
            let nibName = UINib(nibName: "MoedaCell", bundle: nil)
            tabelaMoeda.register(nibName, forCellReuseIdentifier: "MoedaCell")
            tabelaMoeda.dataSource = self
        }
    }
    
    
    
    //MARK: - Properts
    var viewModel: MoedaViewModel = MoedaViewModel()
    
//    let viewController = UIViewController(nibName: "Main", bundle: nil)
//    let navController = UINavigationController(rootViewController: ViewController)
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadAPI()
        self.tabelaMoeda.dataSource = self
        self.tabelaMoeda.delegate = self
        atualizaTabela()
        atualizaData()
        load()
    }
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moedaData.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "MoedaCell", for: indexPath) as! MoedaViewCell
        
        let lista = viewModel.moedaData[indexPath.row]
    
        let rate = lista.rate
        celula.labelRate.text = String(format: "$ %.0f%", rate)

        let nome = lista.assetIDQuote
        celula.labelNome.text = nome
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 120
   }
    
    //MARK: - Methods
    func atualizaData(){
        let data = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        self.dateHomeView.text = dateFormatter.string(from: data)
    }
    
    func atualizaTabela(){
        tabelaMoeda.reloadData()
    }

    func load(){
        if viewModel.moedaData.count != 0{
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.atualizaTabela()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.load()
            }
        }
    }
   
}
