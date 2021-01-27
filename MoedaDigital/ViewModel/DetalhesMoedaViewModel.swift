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
    var valorMoeda: MoedaViewData
    
    init(valorMoeda: MoedaViewData) {
        self.valorMoeda = valorMoeda
    }

    
    //MARK: - Methods
    func montaDicionario() {
        let verifica = MoedaDAO().verificaMoeda(valorMoeda.assetIDQuote)
        if verifica == false {
            let dicionario:Dictionary<String, String> = [
                "assetIDQuote": valorMoeda.assetIDQuote,
                "rate": valorMoeda.rate,
                "time": valorMoeda.time,
            ]
            MoedaDAO().salvaMoeda(dicionarioDeMoeda: dicionario)
        }
        else {
            MoedaDAO().deletaMoeda(moeda: valorMoeda)
        }
    
    }
    
    func recuperaFavorito() -> Bool?{
        var moedaExiste = false
        for moedas in moedaFavorita{
            if moedas.assetIDQuote == valorMoeda.assetIDQuote {
               moedaExiste = true
            }
        }
        return moedaExiste
    }
    
    

}
