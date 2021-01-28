
import Foundation

class MoedaViewModel: RespostaAPI  {

    //MARK: Properts
    private var listaDeValores: ModeloMoeda?
    private var api =  MoedaAPI()
    private var moedaFavorita = MoedaDAO().recuperaDadosDaMoeda()
    var moedaData: Array<MoedaViewData> = []

    //MARK: - Métodos
    func loadAPI(){
        api.configura(delegate: self)
        api.recebeMoeda()
    }
    
    func success(modelo: ModeloMoeda) {
        listaDeValores = modelo
        
        for moedas in modelo.rates{
            moedaData.append(MoedaViewData(model: moedas))
        }
    }
    
    func failure() {
        print("falhou aqui")
    }
    
} //end


    
 
    

