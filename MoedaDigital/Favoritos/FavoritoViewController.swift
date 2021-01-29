//
//  FavoritoViewController.swift
//  MoedaDigital
//
//  Created by Felipe Augusto Vendrasco on 22/01/21.
//

import UIKit

class FavoritoViewController: UIViewController{
    
    @IBOutlet weak var labelData: UILabel!
    
    
    init() {
        
        super.init(nibName: "FavoritoViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var collectionMoeda: UICollectionView! {
        didSet {
            let nibName = UINib(nibName: "FavoritosCollectionViewCell", bundle: nil)
            collectionMoeda.register(nibName, forCellWithReuseIdentifier: "FavoritoCell")
            collectionMoeda.dataSource = self
        }
    }
    
    //MARK: - Properts
    var viewModel: FavoritosViewModel = FavoritosViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        self.title = "Favoritos"
        collectionMoeda.dataSource = self
        collectionMoeda.delegate = self
        atualizaData()
      setupAccessibility()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionMoeda.reloadData()
    }
    
    func atualizaData(){
        let data = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        print(dateFormatter.string(from: data))
    labelData.text = dateFormatter.string(from: data)
    }

} //end

extension FavoritoViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recuperaFavoritos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritoCell", for: indexPath)as! FavoritosCollectionViewCell
        
        let valorMoeda = viewModel.recuperaFavoritos()[indexPath.row]
        
        celulaFavoritos.configuraCelulaFavoritos(valorMoeda)
        
        return celulaFavoritos
    }
    
    // MARK: Acessibilidade
    func setupAccessibility(){
        collectionMoeda.isAccessibilityElement = true
        collectionMoeda.accessibilityLabel = "Neste espaço estão contidos todos os itens que foram favoritados anteriormente"
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
