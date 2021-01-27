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
    
    init(){
        
        super.init(nibName: TabBarViewController.description(), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.tabBarMoedas()
        
      /* let moedaViewController = HomeViewController()
                    
        moedaViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let favoritoViewController = FavoritoViewController()

        favoritoViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

         let tabBarList = [firstViewController, secondViewController]

         viewControllers = tabBarList
 */
    }
    
    func tabBarMoedas() {
        let moedaViewController = UINavigationController(rootViewController: HomeViewController())
        
        let favoritoViewController = UINavigationController(rootViewController: FavoritoViewController())
        
        viewControllers = [moedaViewController, favoritoViewController]
    }
}
