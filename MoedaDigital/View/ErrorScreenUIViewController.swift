//
//  ErrorScreenUIViewController.swift
//  MoedaDigital
//
//  Created by Fernanda Andreia Nascimento on 25/01/21.
//

import UIKit

class ErrorScreenUIView: UIViewController {
    
    init() {
        super.init(nibName: ErrorScreenUIView.description(), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func recarregaDadosButton(_ sender: UIButton) {
        MoedaAPI().recebeMoeda()
        self.present(ViewController(), animated: true, completion: nil)

        
    }
   
    func exibeHomeViewController() {
        self.present(ViewController(), animated: true, completion: nil)
    }

}
