
protocol MoedaViewDataType{
    var time: String {get}
    var assetIDQuote : String {get}
    var rate : Double {get}
}
import Foundation

public class MoedaViewData {
    
    //MARK: - Properts
    private let model: Rate
    
    //MARK: - Constructor
    init(model: Rate){
        self.model = model
    }
}

extension MoedaViewData: MoedaViewDataType {
    var time: String {
        return model.time
    }
    
    var assetIDQuote: String {
        return model.assetIDQuote
    }
    
    var rate: Double {
        return model.rate
    }
    
   
}
