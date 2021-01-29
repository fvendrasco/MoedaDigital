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
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets?apikey=176BDEED-E962-4E3F-9F50-E6295843D003") else {return}
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            switch response.result {
            
            case .success:
                
//                if(response.result.value as? [Any: Any]) != nil{
                    do{
                        guard let data = response.data else {return}
                        let objetoMoeda = try JSONDecoder().decode(ModeloMoeda.self, from: data)
                        self.delegate?.success(modelo: objetoMoeda)
                        
                    } catch let erro {
                        print(erro)
                        print("falhou aqui")
                    }
//                }
                break
            case .failure:
                print(response.error!)
                if let status = response.response?.statusCode {
                    switch (status) {
                    case 400:
                        ErroModel().exibeErro()
                    case 403:
                        ErroModel().exibeErro()
                    case 429:
                        ErroModel().exibeErro()
                    case 550:
                        ErroModel().exibeErro()
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
