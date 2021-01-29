
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
        guard let hour = model.volume1HrsUsd else {return ""}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatterHour = numberFormatter.string(from: NSNumber(value: hour))
//        let horaString = String(format: "$ %.f%", hora)
        return formatterHour!
    }
    
    var volume_1day_usd: String {
        guard let day = model.volume1DayUsd else {return ""}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatterDay = numberFormatter.string(from: NSNumber(value: day))
//        let horaString = String(format: "$ %.f%", hora)
        return formatterDay!
    }
    
    var volume_1mth_usd: String {
        guard let month = model.volume1HrsUsd else {return ""}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatterMonth = numberFormatter.string(from: NSNumber(value: month))
//        let horaString = String(format: "$ %.f%", hora)
        return formatterMonth!
    }
    
    var asset_id: String {
        return model.assetID
    }
    
    var name: String {
        return model.name ?? ""
    }
    
    var price_usd: String {
        guard let price = model.priceUsd else {return "$ 0.0"}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatterPrice = numberFormatter.string(from: NSNumber(value: price))
//        let priceString = String(format: "$ %.5f%", price)
        return String("$ \(formatterPrice!)")
    }
    var id_icon: String {
        return model.idIcon ?? ""
    }
}
