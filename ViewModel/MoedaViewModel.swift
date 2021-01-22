//
//  MainViewModel.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 13/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

//protocol MainViewModelDelegate {
//    func reloadData(movie: MovieViewData)
//}

class MoedaMainViewModel: RespostaAPI  {
    func success(modelo Modelo: ModeloMoeda) {
        listaDeValores = Modelo
        
    }
    
    func failure() {
        print("falhou aqui")
    }

    //MARK: Properts
    
    private var listaDeValores: ModeloMoeda?
    private var api =  MoedaAPI()

    //MARK: - Métodos
    
    func loadAPI(){
        api.configura(delegate: self)
        api.recebeMoeda()
    }

    func loadMovie() -> [Rate]{
        guard  let TabelaDeValores = listaDeValores?.rates else {return[]}
        return TabelaDeValores
    }
}
    

