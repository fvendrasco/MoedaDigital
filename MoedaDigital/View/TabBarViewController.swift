//
//  TabBarViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 25/01/21.
//

//
//import UIKit
//
//class TabBarViewController: UITabBarController {
//
//
//    @IBOutlet weak var buttonMoedasTabBar: TabBarViewController!
//    
//    @IBOutlet weak var buttonFavoritasTabBar: TabBarViewController!
//    
//    init() {
//        super.init(nibName: "HomeViewController", bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//         
//    func tabBarMoedas() {
//        let moedaViewController = UINavigationController(rootViewController: HomeViewController())
//        
//        let favoritoViewController = UINavigationController(rootViewController: FavoritoViewController())
//        
//        viewControllers = [moedaViewController, favoritoViewController]
//    }
//}


import UIKit

class TabBarViewController: UITabBarController {


    @IBOutlet weak var buttonMoedasTabBar: TabBarViewController!
    
    @IBOutlet weak var buttonFavoritasTabBar: TabBarViewController!
    
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarMoedas()
        
    }
         
    func tabBarMoedas() {
        let moedaViewController = UINavigationController(rootViewController: HomeViewController())
        
        let favoritoViewController = UINavigationController(rootViewController: FavoritoViewController())
        
        viewControllers = [moedaViewController, favoritoViewController]
    }
}
