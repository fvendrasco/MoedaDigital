//
//  MoedaViewCell.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 22/01/21.
//

import UIKit

class MoedaViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imagemMoeda: UIImageView!
    
    var viewModel: MoedaViewCellModel = MoedaViewCellModel()
    
    func configuraCell(_ moeda: MoedaViewData){
        labelRate.text = moeda.price_usd
        labelId.text = moeda.asset_id
        labelName.text = moeda.name
        if viewModel.recuperaEstrela(moeda.asset_id) == true {
            labelEstrela.text = "⭐"
        } else {
            labelEstrela.text = ""
        }
//        
//        viewModel.recuperaIcone(imagem: imagemMoeda, id: moeda.id_icon)
        
    }
    
}
