//
//  MoedaViewCell.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 22/01/21.
//

import UIKit

class MoedaViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    
    var viewModel: MoedaViewCellModel = MoedaViewCellModel()
    
    func configuraCell(_ moeda: MoedaViewData){
        labelRate.text = moeda.rate
        labelNome.text = moeda.assetIDQuote
        if viewModel.recuperaEstrela(moeda.assetIDQuote) == true {
            labelEstrela.text = "⭐"
        } else {
            labelEstrela.text = ""
        }
    }
    
}
