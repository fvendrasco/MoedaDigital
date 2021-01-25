  
//
//  DetalhesMoedaService.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 25/01/21.
//

import Foundation
import UIKit

public protocol moedaService{
     func recebeMoedaSelecionada(_ lista: MoedaViewData)
}

public class DetalhesMoedaService: moedaService {

    public init(){
    }
    
    public func recebeMoedaSelecionada(_ lista: MoedaViewData) {
        let vc = DetalhesMoedaViewController()
        if lista != nil{
            vc.lista = lista
        }
        

    }
}
