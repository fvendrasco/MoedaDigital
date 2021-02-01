//
//  Commons.swift
//  Commons
//
//  Created by Breno Luizetto Cintra on 30/01/21.
//

import Foundation

public protocol Commons{
    func atualizaData() -> String
    func configuraValorMoeda(value: Double) -> String
}
public class CommonsMoeda: Commons{
    public init(){
        
    }
    public func atualizaData() -> String{
        let data = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let dataAtual = dateFormatter.string(from: data)
        return dataAtual
    }

    public func configuraValorMoeda(value: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formatterValue = numberFormatter.string(from: NSNumber(value: value)) else { return "0.0"}
        let formatterPrice = String("$ \(formatterValue)")
        return formatterPrice
    }
}

