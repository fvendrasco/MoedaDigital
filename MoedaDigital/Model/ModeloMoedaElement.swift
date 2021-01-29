//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let modeloMoeda = try? newJSONDecoder().decode(ModeloMoeda.self, from: jsonData)
//
//import Foundation
//
//// MARK: - ModeloMoeda
//struct ModeloMoeda: Codable {
//    let rates: [Rate]
//
//    enum CodingKeys: String, CodingKey {
//        case rates
//    }
//}
//
//struct Rate: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
//    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
//    let dataSymbolsCount: Int
//    let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double
//    let idIcon: String
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
//        case priceUsd = "price_usd"
//        case idIcon = "id_icon"
//    }
//}

// ===================================
//// MARK: - ModeloMoeda
//struct ModeloMoeda: Codable {
//    let assetIDBase: String
//    let rates: [Rate]
//
//    enum CodingKeys: String, CodingKey {
//        case assetIDBase = "asset_id_base"
//        case rates
//    }
//}
//
//// MARK: - Rate
//struct Rate: Codable {
//    let time, assetIDQuote: String
//    let rate: Double
//
//    enum CodingKeys: String, CodingKey {
//        case time
//        case assetIDQuote = "asset_id_quote"
//        case rate
//    }
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let modeloMoeda = try? newJSONDecoder().decode(ModeloMoeda.self, from: jsonData)

//import Foundation
//
//// MARK: - ModeloMoeda
//struct ModeloMoeda: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
//    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
//    let dataSymbolsCount: Int
//    let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double
//    let idIcon: String
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
//        case priceUsd = "price_usd"
//        case idIcon = "id_icon"
//    }
//}







// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let modeloMoeda = try? newJSONDecoder().decode(ModeloMoeda.self, from: jsonData)

//import Foundation
//
//// MARK: - ModeloMoedaElement
//struct ModeloMoedaElement: Codable {
//    let id: String
//    let rates: [Rate]
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case rates
//    }
//}
//
//// MARK: - Rate
//struct Rate: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
//    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
//    let dataSymbolsCount: Int
//    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double
//    let priceUsd: Double?
//    let idIcon: String?
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
//        case priceUsd = "price_usd"
//        case idIcon = "id_icon"
//    }
//}
//
//typealias ModeloMoeda = [ModeloMoedaElement]



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let modeloMoeda = try? newJSONDecoder().decode(ModeloMoeda.self, from: jsonData)

//===
//crudcrud
//===


//import Foundation
//
//// MARK: - ModeloMoedaElement
//struct ModeloMoedaElement: Codable {
//    let id: String
//    let rates: [Rate]
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case rates
//    }
//}
//
//// MARK: - Rate
//struct Rate: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
//    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
//    let dataSymbolsCount: Int
//    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double
//    let priceUsd: Double?
//    let idIcon: String?
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
//        case priceUsd = "price_usd"
//        case idIcon = "id_icon"
//    }
//}
//
//typealias ModeloMoeda = [ModeloMoedaElement]


// direto da API

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let modeloMoeda = try? newJSONDecoder().decode(ModeloMoeda.self, from: jsonData)

import Foundation

// MARK: - ModeloMoedaElement
struct ModeloMoedaElement: Codable {
    let assetID: String
    let name: String?
    let typeIsCrypto: Int
    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String?
    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double?
    let priceUsd: Double?
    let idIcon: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }
}

typealias ModeloMoeda = [ModeloMoedaElement]

