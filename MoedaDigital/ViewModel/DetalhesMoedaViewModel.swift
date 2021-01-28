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
    var valorMoeda: MoedaViewData?
    var moedaSalva: Moeda?
    
    init(valorMoeda: MoedaViewData?, moedaSalva: Moeda?) {
        self.valorMoeda = valorMoeda
        self.moedaSalva = moedaSalva
    }

    
    //MARK: - Methods
    func montaDicionario() {
        var verifica = true
        if let valor = valorMoeda{
            if MoedaDAO().verificaMoeda(valor.assetIDQuote) == false {
                verifica = false
                let dicionario:Dictionary<String, String> = [
                    "assetIDQuote": valor.assetIDQuote,
                    "rate": valor.rate,
                    "time": valor.time,
                ]
                MoedaDAO().salvaMoeda(dicionarioDeMoeda: dicionario)
            } else {
                MoedaDAO().deletaMoeda(moeda: valorMoeda, moedaSalva: moedaSalva)
            }
        }  else {
            MoedaDAO().deletaMoeda(moeda: valorMoeda, moedaSalva: moedaSalva)
        }
    
    }
    
    func recuperaFavorito() -> Bool?{
        var moedaExiste = false
        for moedas in moedaFavorita{
            if moedas.assetIDQuote == valorMoeda?.assetIDQuote {
               moedaExiste = true
            } else if moedas.assetIDQuote == moedaSalva?.assetIDQuote{
                moedaExiste = true
            }
        }
        return moedaExiste
    }

}
