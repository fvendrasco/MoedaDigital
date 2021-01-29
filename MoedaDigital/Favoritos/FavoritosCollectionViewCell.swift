//
//  FavoritosCollectionViewCell.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import UIKit

class FavoritosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelType: UILabel!
    
    
    func configuraCelulaFavoritos(_ listaMoedas: Moeda){
        labelRate.text = listaMoedas.price
        labelType.text = listaMoedas.assetId
    }
}
