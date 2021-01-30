//
//  FavoritosViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import Foundation

class FavoritosViewModel {
    
    //MARK: - Properts
    private var listaDeValores: Moeda?
    private var moedaFavoritos: Array<Moeda> = []
    var moedaData: Array<MoedaViewData> = []
    
    //MARK: - Methods
    func recuperaFavoritos() -> Array<Moeda>{
        moedaFavoritos = MoedaDAO().recuperaDadosDaMoeda()
        return moedaFavoritos
    }
}
