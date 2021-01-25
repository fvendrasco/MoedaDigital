//
//  ViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 21/01/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tabelaMoedas: UITableView!
    @IBOutlet weak var labelDataTelaPrincipal: UILabel!
    @IBOutlet weak var pesquisaMoeda: UISearchBar!

    
    //MARK: - Properts
    var viewModel: MoedaViewModel = MoedaViewModel()
    
    
    //MARK: _- Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadAPI()
        self.tabelaMoedas.dataSource = self
        self.tabelaMoedas.delegate = self
        atualizaTabela()
        atualizaData()
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
     
        return viewModel.moedaData.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoedaViewCell
        
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
    
//     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let moedas = viewModel.moedaData[indexPath.row]
//        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesViewController") as! DetalhesMoedaViewController
//        controller.lista = moedas
//        self.navigationController?.pushViewController(controller, animated: true)
//    }

    
}
