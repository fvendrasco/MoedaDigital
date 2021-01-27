//
//  ErroModel.swift
//  MoedaDigital
//
//  Created by Fernanda Andreia Nascimento on 27/01/21.
//

import UIKit

class ErroModel: NSObject {
    
    func exibeErro() -> UIAlertController? {
        
        let alerta = UIAlertController(title: "Erro ", message: "Há algo errado com a sua requisicao, tente novamente", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return alerta
        
    

    
    
}
}
