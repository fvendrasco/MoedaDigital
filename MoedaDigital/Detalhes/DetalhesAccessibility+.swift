//
//  accessibility+.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 01/02/21.
//

import Foundation

extension DetalhesMoedaViewController {
    
    func setupAccessibility(){
         labelRate.isAccessibilityElement = true
         labelTipo.isAccessibilityElement = true
         lastMonth.isAccessibilityElement = true
         lastHour.isAccessibilityElement = true
         lastDay.isAccessibilityElement = true
         labelDia.isAccessibilityElement = true
         labelAno.isAccessibilityElement = true
         labelHora.isAccessibilityElement = true
        viewButton.isAccessibilityElement = true
        labelVolume.isAccessibilityElement = true
         buttonFavorito.isAccessibilityElement = true
         labelRate.accessibilityValue = viewModel?.valorMoeda?.price_usd
         viewCabecalho.isAccessibilityElement = true
         viewCorpo.isAccessibilityElement = true
         viewCabecalho.accessibilityLabel = "Neste espaço está contido a imagem da moeda, sua sigla e seu valor atual e o botão para adicionar aos favoritos"
         viewCorpo.accessibilityLabel = "Neste espaço está contido os valores da moeda selecionada na última hora, dia e mês"
         buttonFavorito.setTitle("Adicionar", for: .normal)
         buttonFavorito.accessibilityLabel = "Adicionar ou Remover Favoritos"
         buttonFavorito.accessibilityHint = "Adicionar e Retirar a moeda aos Favoritos"

         self.accessibilityElements = [ buttonFavorito!]
     }
    
    func configuraLabel(){
        labelRate.font = .preferredFont(forTextStyle: .subheadline)
        labelRate.adjustsFontForContentSizeCategory = true
        labelEstrela.font = .preferredFont(forTextStyle: .body)
        labelEstrela.adjustsFontForContentSizeCategory = true
        labelTipo.font = .preferredFont(forTextStyle: .body)
        labelTipo.adjustsFontForContentSizeCategory = true
        lastMonth.font = .preferredFont(forTextStyle: .subheadline)
        lastMonth.adjustsFontForContentSizeCategory = true
        lastHour.font = .preferredFont(forTextStyle: .body)
        lastHour.adjustsFontForContentSizeCategory = true
        lastDay.font = .preferredFont(forTextStyle: .body)
        lastDay.adjustsFontForContentSizeCategory = true
        labelDia.font = .preferredFont(forTextStyle: .body)
        labelDia.adjustsFontForContentSizeCategory = true
        labelAno.font = .preferredFont(forTextStyle: .body)
        labelAno.adjustsFontForContentSizeCategory = true
        labelHora.font = .preferredFont(forTextStyle: .body)
        labelHora.adjustsFontForContentSizeCategory = true
        viewButton.sizeToFit()
        labelVolume.font = .preferredFont(forTextStyle: .body)
        labelVolume.adjustsFontForContentSizeCategory = true
    }
}
