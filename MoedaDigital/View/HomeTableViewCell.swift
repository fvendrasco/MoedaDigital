//
//  HomeTableViewCell.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var moedaView: UIView!
    @IBOutlet weak var valueCoin: UILabel!
    @IBOutlet weak var typeCoin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
