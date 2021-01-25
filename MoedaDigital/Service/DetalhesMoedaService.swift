////
////  DetalhesMoedaService.swift
////  MoedaDigital
////
////  Created by Breno Luizetto Cintra on 25/01/21.
////
//
//import Foundation
//import UIKit
//
//public protocol recebeMoedaService{
//     func recebeMoedaSelecionada(_ lista: MoedaViewData,_ nav: UINavigationController)
//}
//
//public class DetalhesMoedaService: recebeMoedaService {
//    
//    public init(){
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    public func recebeMoedaSelecionada(_ lista: MoedaViewData,_ nav: UINavigationController) {
//            let vc = DetalhesMoedaViewController(lista: lista)
//            navigationController?.pushViewController(vc, animated: true)
//        
//    }
//}
