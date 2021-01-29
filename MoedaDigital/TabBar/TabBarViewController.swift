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
        tabBar.barTintColor = .black
        tabBarMoedas()
        setupAccessibility()
    }
    

    func tabBarMoedas() {        
 
        //MARK: - TabBar Moedas
        let moedaViewController = UINavigationController(rootViewController: HomeViewController())
        moedaViewController.navigationBar.barStyle = UIBarStyle.black
        moedaViewController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        moedaViewController.navigationBar.tintColor = .white
        if #available(iOS 13.0, *) {
            moedaViewController.tabBarItem.image = UIImage(systemName: "dollarsign.circle")
            moedaViewController.tabBarItem.selectedImage = UIImage(systemName: "dollarsign.circle.fill")
        }

    
        
        //MARK: - TabBar Favoritos
        let favoritoViewController = UINavigationController(rootViewController: FavoritoViewController())
        favoritoViewController.navigationBar.barStyle = UIBarStyle.black
        favoritoViewController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let item = UITabBarItem()
        item.title = "Adicionadas"
        if #available(iOS 13.0, *) {
            item.image = UIImage(systemName: "star")
            item.selectedImage = UIImage(systemName: "star.fill")
        }
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
