//
//  MoedaViewCellModel.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import Foundation
import UIKit
import AlamofireImage

class MoedaViewCellModel {
    
    func recuperaEstrela(_ nome: String) -> Bool{
        MoedaDAO().verificaMoeda(nome)
    }
    
//    func recuperaIcone(imagem: UIImageView, id: String){
//        let iconeMoeda = (String)
//        imagem.af_setImage(withURL: url)
//    }
}
