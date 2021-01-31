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
        let iconUrl = listaMoedas.icon?.replacingOccurrences(of: "-", with: "")
        if let url = URL(string: "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_32/\(iconUrl).png"){
          self.imageCoin.af_setImage(withURL: url, placeholderImage: UIImage(named: "bitcoin"))
        }
    }
}
