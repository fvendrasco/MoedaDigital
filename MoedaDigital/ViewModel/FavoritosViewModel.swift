//
//  FavoritosViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import Foundation

class FavoritosViewModel {
    
    private var moedaFavoritos: Array<Moeda> = []
    
    func recuperaFavoritos() -> Array<Moeda>{
        moedaFavoritos = MoedaDAO().recuperaDadosDaMoeda()
        return moedaFavoritos
    }
    
}
