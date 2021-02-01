//
//  HomeTableViewCell.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit
import AlamofireImage

class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageCoin: UIImageView!
    // MARK: - Properts
    var viewModel: MoedaViewCellModel = MoedaViewCellModel()
    // MARK: - Methods
    func configuraCell(_ moeda: MoedaViewData) {
        labelRate.text = moeda.price_usd
        labelId.text = moeda.asset_id
        labelName.text = moeda.name
        if viewModel.recuperaEstrela(moeda.asset_id) == true {
            labelEstrela.text = "⭐"
        } else {
            labelEstrela.text = ""
        }
        let iconUrl = moeda.id_icon.replacingOccurrences(of: "-", with: "")
        if let url = URL(string: "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_64/\(iconUrl).png"){
           let image = self.imageCoin.af_setImage(withURL: url, placeholderImage: UIImage(named: "bitcoin"))
        }
    }
}
