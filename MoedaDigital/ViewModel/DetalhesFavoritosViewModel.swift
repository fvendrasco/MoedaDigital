//
//  DetalhesFavoritosViewModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

//
//import Foundation
//
//class DetalhesFavoritosViewModel  {
//    
//    //MARK: - Properts
//    private var moedaFavorita = MoedaDAO().recuperaDadosDaMoeda()
//    var valorMoeda: Moeda
//    
//    init(valorMoeda: Moeda) {
//        self.valorMoeda = valorMoeda
//    }
//
//    
//    //MARK: - Methods
//    func montaDicionario() {
//            MoedaDAO().deletaMoeda(moeda: valorMoeda)
//    }
//    
//    func recuperaFavorito() -> Bool?{
//        var moedaExiste = false
//        for moedas in moedaFavorita{
//            if moedas.assetIDQuote == valorMoeda.assetIDQuote {
//               moedaExiste = true
//            }
//        }
//        return moedaExiste
//    }
//    
//    
//
//}
