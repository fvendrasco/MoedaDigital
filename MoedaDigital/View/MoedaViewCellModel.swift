//
//  MoedaViewCellModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import Foundation

class MoedaViewCellModel {
    
    func recuperaEstrela(_ nome: String) -> Bool{
        MoedaDAO().verificaMoeda(nome)
    }
}
