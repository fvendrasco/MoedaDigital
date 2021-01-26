//
//  ErrorScreenUIView.swift
//  MoedaDigital
//
//  Created by Fernanda Andreia Nascimento on 25/01/21.
//

import UIKit

class ErrorScreenUIView: UIView {

    @IBAction func recarregaDadosButton(_ sender: UIButton) {
        MoedaAPI().recebeMoeda()
    
    }
   


}
