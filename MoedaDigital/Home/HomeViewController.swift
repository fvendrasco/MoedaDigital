//
//  ViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 21/01/21.
//

import UIKit
import Commons

class HomeViewController: UIViewController {
    
    //MARK: - IBoutlet
    @IBOutlet weak var tabelaMoedas: UITableView!{
        didSet {
            let nibName = UINib(nibName: "HomeTableViewCell", bundle: nil)
            tabelaMoedas.register(nibName, forCellReuseIdentifier: "MoedaCell")
            tabelaMoedas.dataSource = self
        }
    }
    @IBOutlet weak var labelDataTelaPrincipal: UILabel!
    @IBOutlet weak var pesquisaMoeda: UISearchBar!

    //MARK: - Properts
    var viewModel: MoedaViewModel = MoedaViewModel()
    var listaMoeda: Array<MoedaViewData> = []
    let commons = CommonsMoeda()

    // MARK: - Constructor
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        self.title = "Moeda Digital"
        super.viewDidLoad()
        viewModel.loadAPI()
        self.tabelaMoedas.dataSource = self
        self.tabelaMoedas.delegate = self
        pesquisaMoeda.delegate = self
        labelDataTelaPrincipal.text = commons.atualizaData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        load()
    }

    //MARK: - Methods
    func atualizaTabela(){
        tabelaMoedas.reloadData()
    }
    
    func load(){
        if viewModel.moedaData.count != 0{
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.listaMoeda = self.viewModel.moedaData
                self.atualizaTabela()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.load()
            }
        }
    }
    
    
} //end

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return listaMoeda.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "MoedaCell", for: indexPath) as! HomeTableViewCell
        let valorMoeda = listaMoeda[indexPath.row]
        
        celula.configuraCell(valorMoeda)
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 120
   }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valorMoeda = listaMoeda[indexPath.row]
        let model = DetalhesMoedaViewModel(valorMoeda: valorMoeda, moedaSalva: nil)
        let controller = DetalhesMoedaViewController(viewModel: model)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

//MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaMoeda = viewModel.moedaData
        
        if searchText != ""{
            listaMoeda = listaMoeda.filter({ $0.name.contains(searchText) })
        }
        atualizaTabela()
    }
    
}




