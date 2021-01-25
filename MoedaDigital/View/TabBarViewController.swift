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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableViewMoeda = moreNavigationController.viewControllers.first?.view as? UITableView
    }
}
