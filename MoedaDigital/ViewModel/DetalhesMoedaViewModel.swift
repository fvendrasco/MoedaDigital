//
//  DetalhesMoedaViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 26/01/21.
//

import Foundation

class DetalhesMoedaViewModel  {
    
    //MARK: - Properts
    private var moedaFavorita = MoedaDAO().recuperaDadosDaMoeda()
    
    //MARK: - Methods
    func montaDicionario(_ lista: MoedaViewData) -> Dictionary<String, Any> {

        let dicionario:Dictionary<String, String> = [
            "assetIDQuote": lista.assetIDQuote,
            "rate": lista.rate,
            "time": lista.time,
        ]
            return dicionario
    }
    
    func recuperaFavorito(_ nome: String) -> Bool?{
        var moedaExiste = false
        for moedas in moedaFavorita{
            if moedas.assetIDQuote == nome {
               moedaExiste = true
            }
        }
        return moedaExiste
    }
    
}
