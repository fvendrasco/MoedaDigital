
import Foundation

protocol MoedaViewDelegate {
    func reloadData(moeda: MoedaViewData)
}

class MoedaViewModel: RespostaAPI  {
    func success(modelo: ModeloMoeda) {
        listaDeValores = modelo
        
        for moedas in modelo.rates{
            moedaData.append(MoedaViewData(model: moedas))
        }
        
    }
    
    func failure() {
        print("falhou aqui")
    }

    //MARK: Properts
    
    private var listaDeValores: ModeloMoeda?
    private var api =  MoedaAPI()
    var moedaData: [MoedaViewData] = []
    var delegate: MoedaViewDelegate?
    

    //MARK: - Métodos
    
    func loadAPI(){
        api.configura(delegate: self)
        api.recebeMoeda()
    }
    
 
}
    

