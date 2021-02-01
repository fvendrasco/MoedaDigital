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

class MoedaAPI: NSObject, MoedasProtocolo {
    private var delegate: RespostaAPI?

    // MARK: - Methods
    func configura(delegate: RespostaAPI) {
       self.delegate = delegate
    }
    // MARK: - GET
    func recebeMoeda() {
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets?apikey=176BDEED-E962-4E3F-9f50-E6295843D003") else {return}
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {return}
                        let objetoMoeda = try JSONDecoder().decode(ModeloMoeda.self, from: data)
                        self.delegate?.success(modelo: objetoMoeda)
                    } catch let erro {
                        print(erro)
                        if let codigoErro = response.response?.statusCode {
                            switch codigoErro {
                            case 400:
                                self.errorScreen(titleError: "erro 400", messageError: "Bad Request - Há algo de errado com a sua solicitação")
                            case 401:
                                self.errorScreen(titleError: "erro 401", messageError: "Há algo de errado com a sua solicitação")
                            case 403:
                                self.errorScreen(titleError: "erro 403", messageError: "Sua chave API não tem os privilégios necessários")
                            case 429:
                                self.errorScreen(titleError: "erro 429", messageError: "Excedida a quantidade de requisicoes com a sua chave API")
                            case 550:
                                self.errorScreen(titleError: "erro 550", messageError: "Sua requisicao não retorno nenhum dado")
                                
                            default:
                                break
//                            }
//                            if codigoErro == 400 {
//                                print("400 Bad Request - Há algo de errado com a sua solicitação")
//                            }
//                            if codigoErro == 401 {
//                                print("401 Unauthorized - Sua chave API está incorreta")
//                            }
//                            if codigoErro == 403 {
//                                print("403 Forbidden - Sua chave API não tem os privilégios necessários")
//                            }
//                            if codigoErro == 429 {
//                                print("429 Too many requests - Excedida a quantidade de requisicoes com a sua chave API")
//                            }
//                            if codigoErro == 550 {
//                                print("550 No Data - Sua requisicao não retorno nenhum dado")
//                            }
                        }
                    }
                }
                        case .failure:
                        print(response.error!)
                        }
                    }
            }
    func errorScreen(titleError: String, messageError: String) {
        let errorScreen = UIWindow(frame: UIScreen.main.bounds)
        errorScreen.rootViewController = ErrorScreenViewController()
        errorScreen.makeKeyAndVisible()
        let alerta = UIAlertController(title: "Erro ", message: "Há algo errado com a sua requisicao, tente novamente", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        errorScreen.rootViewController?.present(alerta, animated: true, completion: nil)
    }
}

