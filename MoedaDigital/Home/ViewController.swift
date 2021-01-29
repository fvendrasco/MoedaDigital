//
//  ViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 21/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelaMoedas: UITableView!
    @IBOutlet weak var labelDataTelaPrincipal: UILabel!
    @IBOutlet weak var pesquisaMoeda: UISearchBar!

    //MARK: - Properts
    var viewModel: MoedaViewModel = MoedaViewModel()
    var listaMoeda: Array<MoedaViewData> = []

    //MARK: _- Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadAPI()
        self.tabelaMoedas.dataSource = self
        self.tabelaMoedas.delegate = self
        pesquisaMoeda.delegate = self
        atualizaData()
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

} //end

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return listaMoeda.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoedaViewCell
        let valorMoeda = listaMoeda[indexPath.row]
        celula.configuraCell(valorMoeda)
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 120
   }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valorMoeda = listaMoeda[indexPath.row]
        let model = DetalhesMoedaViewModel(valorMoeda: valorMoeda, moedaSalva: nil)
        let controller = DetalhesMoedaViewController(viewModel: model)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    listaMoeda = viewModel.moedaData
    if searchText != ""{
        listaMoeda = listaMoeda.filter({ $0.name.contains(searchText) })
    }
        atualizaTabela()
}
    
}




