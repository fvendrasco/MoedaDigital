
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
    private var moedaFavorita = MoedaDAO().recuperaDadosDaMoeda()
    var moedaData: [MoedaViewData] = []
    var delegate: MoedaViewDelegate?
    
    

    //MARK: - Métodos
    
    func loadAPI(){
        api.configura(delegate: self)
        api.recebeMoeda()
    }
    
    func recuperaEstrela(_ nome: String) -> Bool{
        var moedaExiste = false
        for moedas in moedaFavorita{
            if moedas.assetIDQuote == nome {
               moedaExiste = true
            }
        }
        return moedaExiste
    }
    

} //end


    
 
    

