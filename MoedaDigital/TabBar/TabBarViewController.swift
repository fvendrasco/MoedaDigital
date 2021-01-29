//
//  TabBarViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 25/01/21.

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: IBOutlet
    @IBOutlet weak var tabBarFavoritos: UITabBar!
    
    // MARK: IBOutlet
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarMoedas()
        setupAccessibility()
    }
    

    func tabBarMoedas() {        
 
        //MARK: - TabBar Moedas
        let moedaViewController = UINavigationController(rootViewController: HomeViewController())
        moedaViewController.title = "Moedas"
        moedaViewController.tabBarItem.image = UIImage(named: "Coin")
        moedaViewController.tabBarItem.selectedImage = UIImage(named: "CoinPress")
    
        
        //MARK: - TabBar Favoritos
        let favoritoViewController = UINavigationController(rootViewController: FavoritoViewController())
        
        let item = UITabBarItem()
        
        item.title = "Favoritos"
        item.image = UIImage(named: "Favorite")
        item.selectedImage = UIImage(named: "FavoritePress")
        favoritoViewController.tabBarItem = item
            
        viewControllers = [moedaViewController, favoritoViewController]
        
        //MARK: - TabBar Botoes re-size
        guard let items = tabBar.items else {return }
        for item in items{
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    // MARK: Acessibilidade
    func setupAccessibility(){
        tabBarFavoritos.isAccessibilityElement = true
        tabBarFavoritos.accessibilityLabel = "Nesta barra de abas, você pode acessar o menu das Moedas ou de Favoritos"
    }
}

extension TabBarViewController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selecionada\(viewController.title!)")
    }
}
