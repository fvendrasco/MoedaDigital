//
//  FavoritosAccessibility.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 01/02/21.
//

import Foundation

extension FavoritoViewController {
    // MARK: Accessibility
    func setupAccessibility(){
        collectionMoeda.isAccessibilityElement = true
        labelData.isAccessibilityElement = true
        collectionMoeda.accessibilityLabel = "Esta tabela traz os dados das Moedas, os dados são nome, imagem, sigla e valor"
        labelData.accessibilityLabel = "Neste campo consta a data de hoje"
        labelData.accessibilityTraits = .staticText
        self.accessibilityElements = [collectionMoeda!, labelData!]
    }
    func configuraLabel(){
        labelData.font = .preferredFont(forTextStyle: .subheadline)
        labelData.adjustsFontForContentSizeCategory = true
    }
}
