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
<<<<<<< HEAD
<<<<<<< HEAD
//        labelName.text = listaMoedas.name

=======
        
>>>>>>> develop

=======
//        labelName.text = listaMoedas.name

>>>>>>> 1665dd90c60dd2b05371d51b73b7d8b669b65d07
    }
}
