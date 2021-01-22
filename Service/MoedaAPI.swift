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
                
                break
            }
            
        }
        
    }
    
}
