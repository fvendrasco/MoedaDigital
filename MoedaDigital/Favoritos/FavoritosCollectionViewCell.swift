//
//  FavoritosCollectionViewCell.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 27/01/21.
//

import UIKit
import AlamofireImage

class FavoritosCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var imageCoin: UIImageView!
    // MARK: - Methods
    func configuraCelulaFavoritos(_ listaMoedas: Moeda) {
        labelRate.text = listaMoedas.price
        labelType.text = listaMoedas.assetId
        labelName.text = listaMoedas.name
        imageCoin.image = UIImage(named: "bitcoin")
    }
}
