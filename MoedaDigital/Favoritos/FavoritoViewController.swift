//
//  FavoritoViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class FavoritoViewController: UIViewController{
    
    init() {
        
        super.init(nibName: "FavoritoViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionMoeda: UICollectionView!
    
    //MARK: - Properts
    var viewModel: FavoritosViewModel = FavoritosViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        collectionMoeda.dataSource = self
        collectionMoeda.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionMoeda.reloadData()
    }

} //end

extension FavoritoViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recuperaFavoritos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFavoritos", for: indexPath)as! FavoritosCollectionViewCell
        
        let valorMoeda = viewModel.recuperaFavoritos()[indexPath.row]
        
        celulaFavoritos.configuraCelulaFavoritos(valorMoeda)
        
        return celulaFavoritos
    }
}

extension FavoritoViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let valor = viewModel.recuperaFavoritos()[indexPath.row]
        let model = DetalhesMoedaViewModel(valorMoeda: nil, moedaSalva: valor)
        let controller = DetalhesMoedaViewController(viewModel: model)
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

extension FavoritoViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }

        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-15, height: 140) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
}
