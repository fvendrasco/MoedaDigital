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
                        if let codigoErro = response.response?.statusCode {
                            
                            if codigoErro == 400 {
                                print("400 Bad Request - Há algo de errado com a sua solicitação")
                            }
                            
                            if codigoErro == 401 {
                                print("400 Unauthorized - Sua chave API está incorreta")
                            }
                          
                            if codigoErro == 403 {
                                print("403 Forbidden - Sua chave API não tem os privilégios necessários")
                            }
                            
                            if codigoErro == 429 {
                                print("429 Too many requests - Excedida a quantidade de requisicoes com a sua chave API")
                            }
                            
                            if codigoErro == 550 {
                                print("550 No Data - Sua requisicao não retorno nenhum dado")
                            }
                        }

                    }
                break
            case .failure:
                print(response.error!)
                
                break
            }
            
        }
        
    }
    
}
