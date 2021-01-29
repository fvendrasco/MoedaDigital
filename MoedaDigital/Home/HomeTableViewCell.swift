//
//  HomeTableViewCell.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
//    init() {
//
//        super.init(style: "HomeTableViewCell", reuseIdentifier: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    
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
    }
    
}
