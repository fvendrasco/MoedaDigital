//
//  NewTabBarViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 26/01/21.
//

import UIKit

class NewTabBarViewController: UITabBarController {

    var moedaViewController: ViewController?
    var favoritoViewController: ViewController?
    var subViewController:[UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        subViewController.append(moedaViewController!)
        subViewController.append(favoritoViewController!)
    }
}
