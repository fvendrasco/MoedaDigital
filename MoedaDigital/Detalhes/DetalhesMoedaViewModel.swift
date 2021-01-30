//
//  DetalhesMoedaViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 26/01/21.
//

import Foundation

class DetalhesMoedaViewModel  {
    
    //MARK: - Properts
    private let moedaDAO: MoedaDAO
    var valorMoeda: MoedaViewData?
    var moedaSalva: Moeda?
    
    //MARK: - Constructor
    init(valorMoeda: MoedaViewData?, moedaSalva: Moeda?, moedaDAO: MoedaDAO = MoedaDAO()) {
        self.valorMoeda = valorMoeda
        self.moedaSalva = moedaSalva
        self.moedaDAO = moedaDAO
    }

    
    //MARK: - Methods
    func montaDicionario() {
        var verifica = true
        if let valor = valorMoeda{
            if moedaDAO.verificaMoeda(valor.asset_id) == false {
                verifica = false
                let dicionario:Dictionary<String, String> = [
                    "name" : valor.name,
                    "assetId": valor.asset_id,
                    "price_usd": valor.price_usd,
                    "lastHour": valor.volume_1hrs_usd,
                    "lastDay": valor.volume_1day_usd,
                    "LastMonth": valor.volume_1mth_usd,
                ]
                moedaDAO.salvaMoeda(dicionarioDeMoeda: dicionario)
            } else {
                moedaDAO.deletaMoeda(moeda: valorMoeda, moedaSalva: moedaSalva)
            }
        }  else {
            moedaDAO.deletaMoeda(moeda: valorMoeda, moedaSalva: moedaSalva)
        }
    
    }
    
    func recuperaFavorito() -> Bool?{
        var moedaExiste = false
        for moedas in moedaDAO.recuperaDadosDaMoeda(){
            if moedas.assetId == valorMoeda?.asset_id {
               moedaExiste = true
            } else if moedas.assetId == moedaSalva?.assetId{
                moedaExiste = true
            }
        }
        return moedaExiste
    }

}
