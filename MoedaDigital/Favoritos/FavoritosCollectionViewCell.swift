//
//  FavoritosCollectionViewCell.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import UIKit

class FavoritosCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelRate: UILabel!
        
    func configuraCelulaFavoritos(_ listaMoedas: Moeda){
        labelRate.text = listaMoedas.price
        labelType.text = listaMoedas.assetId
        

    }
}
