//
//  MoedaAPI.swift
//  MoedaCoin
//
//  Created by Breno Luizetto Cintra on 21/01/21.
//

protocol MoedasProtocolo: class {
    func recebeMoeda()
}

protocol RespostaAPI {
    func success(modelo: ModeloMoeda)
    func failure()
}

import Foundation
import Alamofire

class MoedaAPI: NSObject, MoedasProtocolo{
    
    private var delegate: RespostaAPI?

    //MARK: - Methods
    func configura(delegate: RespostaAPI) {
       self.delegate = delegate
    }
    
    func recebeMoeda(){
        guard let url = URL(string: "https://rest.coinapi.io/v1/exchangerate/BTC?apikey=50A700C0-CC3E-4D1D-B1A6-7E3BF21E8E0F") else {return}
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            switch response.result {
            
            case .success:
                
                if(response.result.value as? [String: Any]) != nil{
                    do{
                        guard let data = response.data else {return}
                        let objetoMoeda = try JSONDecoder().decode(ModeloMoeda.self, from: data)
                        self.delegate?.success(modelo: objetoMoeda)
                        
                    } catch {
                        print("falhou aqui")
                    }
                }
                break
            case .failure:
                print(response.error!)
                if let status = response.response?.statusCode {
                    switch (status) {
                    case 400:
                    func exibeErro() -> UIAlertController? {
                        let alerta = UIAlertController(title: "Erro 400 - Bad Request ", message: "Há algo errado com a sua requisicao, tente novamente", preferredStyle: .alert)
                        alerta.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
                        return alerta
                        }
                    case 403:
                     func exibeErro() -> UIAlertController? {
                    let alerta = UIAlertController(title: "Erro 403 - Proibido ", message: "Há algo errado com a sua requisicao, tente novamente", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
                    return alerta
                    }
                    case 429:
                    func exibeErro() -> UIAlertController? {
                    let alerta = UIAlertController(title: "Erro 403 - Requisicoes Excessivas ", message: "Há algo errado com a sua requisicao, tente novamente", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
                    return alerta
                                            }
                    case 550:
                    func exibeErro() -> UIAlertController? {
                    let alerta = UIAlertController(title: "Erro 550 - Sem Dados ", message: "Há algo errado com a sua requisicao, tente novamente", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
                    return alerta
                    }
                    break
                        
                    default:
                        break
                    }
                }
                
                break
            }
            
        }
        
    }
    
}
