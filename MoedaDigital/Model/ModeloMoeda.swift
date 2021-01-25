// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let modeloMoeda = try? newJSONDecoder().decode(ModeloMoeda.self, from: jsonData)

import Foundation

// MARK: - ModeloMoeda
struct ModeloMoeda: Codable {
    let assetIDBase: String
    let rates: [Rate]

    enum CodingKeys: String, CodingKey {
        case assetIDBase = "asset_id_base"
        case rates
    }
}

// MARK: - Rate
struct Rate: Codable {
    let time, assetIDQuote: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case time
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
