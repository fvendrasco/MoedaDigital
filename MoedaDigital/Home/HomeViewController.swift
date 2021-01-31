//
//  ViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 21/01/21.
//

import UIKit

class HomeViewController: UIViewController {
    
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
        atualizaData()
        setupAccessibility()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        load()
    }

    //MARK: - Methods
    func atualizaTabela(){
        tabelaMoedas.reloadData()
    }
    
    func atualizaData(){
        let data = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        self.labelDataTelaPrincipal.text = dateFormatter.string(from: data)
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
    
    // MARK: Accessibility
    func setupAccessibility(){
        tabelaMoedas.isAccessibilityElement = true
        labelDataTelaPrincipal.isAccessibilityElement = true
        pesquisaMoeda.isAccessibilityElement = true

        
        tabelaMoedas.accessibilityLabel = "Esta tabela traz os dados das Moedas, os dados são nome, imagem, sigla e valor"
        labelDataTelaPrincipal.accessibilityLabel = "Neste campo consta a data de hoje"
        labelDataTelaPrincipal.accessibilityTraits = .staticText
        pesquisaMoeda.accessibilityLabel = "Informe o nome da moeda que deseja buscar"
        
        self.accessibilityElements = [labelDataTelaPrincipal!, pesquisaMoeda!, tabelaMoedas!]
    }
    
} //end

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.moedaData.count
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

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valorMoeda = listaMoeda[indexPath.row]
        let model = DetalhesMoedaViewModel(valorMoeda: valorMoeda, moedaSalva: nil)
        let controller = DetalhesMoedaViewController(viewModel: model)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaMoeda = viewModel.moedaData
        
        if searchText != ""{
            listaMoeda = listaMoeda.filter({ $0.asset_id.contains(searchText) })
        }
        atualizaTabela()
    }
    
}




