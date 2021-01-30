
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
import Commons

public class MoedaViewData {
    
    //MARK: - Properts
    private let model: ModeloMoedaElement
    let commons = CommonsMoeda()
    
    //MARK: - Constructor
    init(model: ModeloMoedaElement){
        self.model = model
    }
}

extension MoedaViewData: MoedaViewDataType {
    var volume_1hrs_usd: String {
        guard let hour = model.volume1HrsUsd else {return ""}
        return commons.configuraValorMoeda(value: hour)
    }
    
    var volume_1day_usd: String {
        guard let day = model.volume1DayUsd else {return ""}
        return commons.configuraValorMoeda(value: day)
    }
    
    var volume_1mth_usd: String {
        guard let month = model.volume1HrsUsd else {return ""}
        return commons.configuraValorMoeda(value: month)
    }
    
    var asset_id: String {
        return model.assetID
    }
    
    var name: String {
        return model.name ?? ""
    }
    
    var price_usd: String {
        guard let price = model.priceUsd else {return "$ 0.0"}
        return commons.configuraValorMoeda(value: price)
    }
    var id_icon: String {
        return model.idIcon ?? ""
    }
}
