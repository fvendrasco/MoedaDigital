//
//  FavoritoViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class FavoritoViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionMoeda: UICollectionView!
    
    var viewModel: FavoritosViewModel = FavoritosViewModel()
    
    override func viewDidLoad() {
        collectionMoeda.dataSource = self
        collectionMoeda.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }

        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-30, height: 140) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }

} //end

extension FavoritoViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recuperaFavoritos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFavoritos", for: indexPath)as! FavoritosCollectionViewCell
        
        let valorMoeda = viewModel.recuperaFavoritos()[indexPath.row]
        
        let f: Array<Any> = viewModel.recuperaFavoritos()
        
        
        celulaFavoritos.configuraCelulaFavoritos(valorMoeda)
        
        return celulaFavoritos
    }
}

//extension FavoritoViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let valor = viewModel.recuperaFavoritos()[indexPath.row]
//        let model = DetalhesFavoritosViewModel(valorMoeda: valor)
//        let controller = DetalhesMoedaViewController(viewModel: model)
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
//
//}
