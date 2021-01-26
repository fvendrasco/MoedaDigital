//
//  DetalhesMoedaViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 26/01/21.
//

import Foundation

class DetalhesMoedaViewModel  {
    
    func montaDicionario(_ lista: MoedaViewData) -> Dictionary<String, Any> {

        let dicionario:Dictionary<String, String> = [
            "assetIDQuote": lista.assetIDQuote,
            "rate": lista.rate,
            "time": lista.time,
           
        ]
            return dicionario
        
    }
    
}
