//
//  FavoritosViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import Foundation

class FavoritosViewModel {
    
    private var listaDeValores: Moeda?
    private var moedaFavoritos: Array<Moeda> = []
    var moedaData: Array<MoedaViewData> = []
    
    func recuperaFavoritos() -> Array<Moeda>{
        moedaFavoritos = MoedaDAO().recuperaDadosDaMoeda()
        return moedaFavoritos
    }
    
//    func success() {
//
//        guard let listaDeValores = moeda else {return}
//
//        for moedas in Moeda.{
//            moedaData.append(MoedaViewData(model: moedas))
//
//        }
//
//    }
}
