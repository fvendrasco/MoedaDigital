//
//  TabBarViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 25/01/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var buttonMoedasTabBar: UIViewController!
    
    @IBOutlet weak var buttonFavoritasTabBar: UIViewController!
    
    init() {
        super.init(nibName: HomeViewController.description(), bundle: nil)
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
