
protocol MoedaViewDataType{
    var volume_1hrs_usd: String {get}
    var volume_1day_usd: String {get}
    var volume_1mth_usd: String {get}
    var asset_id : String {get}
    var name : String {get}
    var price_usd : String {get}
    var id_icon: String {get}
}
import Foundation

public class MoedaViewData {
    
    //MARK: - Properts
    private let model: ModeloMoedaElement
    
    //MARK: - Constructor
    init(model: ModeloMoedaElement){
        self.model = model
    }
}

extension MoedaViewData: MoedaViewDataType {
    var volume_1hrs_usd: String {
        guard let hora = model.volume1HrsUsd else {return ""}
        let horaString = String(format: "$ %.0f%", hora)
        return horaString
    }
    
    var volume_1day_usd: String {
        guard let hora = model.volume1DayUsd else {return ""}
        let horaString = String(format: "$ %.0f%", hora)
        return horaString
    }
    
    var volume_1mth_usd: String {
        guard let hora = model.volume1MthUsd else {return ""}
        let horaString = String(format: "$ %.0f%", hora)
        return horaString
    }
    
    var asset_id: String {
        return model.assetID
    }
    
    var name: String {
        return model.name ?? ""
    }
    
    var price_usd: String {
        guard let price = model.volume1MthUsd else {return ""}
        let priceString = String(format: "$ %.0f%", price)
        return priceString
    }
    var id_icon: String {
        return model.idIcon ?? ""
    }
}
