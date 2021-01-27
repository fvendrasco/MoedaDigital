//
//  FavoritoViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class FavoritoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionMoeda: UICollectionView!
    
    var viewModel = FavoritosViewModel()

    override func viewDidLoad() {
        collectionMoeda.dataSource = self
        collectionMoeda.delegate = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recuperaFavoritos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFavoritos", for: indexPath)as! FavoritoViewCell
        
        let listaMoedas = viewModel.recuperaFavoritos()[indexPath.row]
        
        celulaFavoritos.configuraCelulaFavoritos(listaMoedas)
        
        return celulaFavoritos
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }

        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }

}
