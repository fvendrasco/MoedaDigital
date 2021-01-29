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
            if MoedaDAO().verificaMoeda(valor.asset_id) == false {
                verifica = false
                let dicionario:Dictionary<String, String> = [
                    "assetId": valor.asset_id,
                    "price_usd": valor.price_usd,
                    "lastHour": valor.volume_1hrs_usd,
                    "lastDay": valor.volume_1day_usd,
                    "LastMonth": valor.volume_1mth_usd,
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
            if moedas.assetId == valorMoeda?.asset_id {
               moedaExiste = true
            } else if moedas.assetId == moedaSalva?.assetId{
                moedaExiste = true
            }
        }
        return moedaExiste
    }

}
