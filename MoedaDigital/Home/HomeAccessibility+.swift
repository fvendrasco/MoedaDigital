//
//  HomeAccessibility.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 01/02/21.
//

import Foundation

extension HomeViewController{
    // MARK: Accessibility
    func setupAccessibility(){
        tabelaMoedas.isAccessibilityElement = true
        labelDataTelaPrincipal.isAccessibilityElement = true
        pesquisaMoeda.isAccessibilityElement = true
        tabelaMoedas.accessibilityLabel = "Esta tabela traz os dados das Moedas, os dados são nome, imagem, sigla e valor"
        labelDataTelaPrincipal.accessibilityLabel = "Neste campo consta a data de hoje"
        labelDataTelaPrincipal.accessibilityTraits = .staticText
        pesquisaMoeda.accessibilityLabel = "Informe o nome da moeda que deseja buscar"
        self.accessibilityElements = [labelDataTelaPrincipal!, pesquisaMoeda!, tabelaMoedas!]
    }
    
    func configuraLabel(){
        labelDataTelaPrincipal.font = .preferredFont(forTextStyle: .subheadline)
        labelDataTelaPrincipal.adjustsFontForContentSizeCategory = true
    }
}


