//
//  MoedaDAO.swift
//  MoedaDigital
//
//  Created by Breno Luizetto Cintra on 26/01/21.
//

import UIKit
import CoreData

class MoedaDAO: NSObject, NSFetchedResultsControllerDelegate {

    var gerenciadorDeResultados:NSFetchedResultsController<Moeda>?
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func recuperaDadosDaMoeda() -> Array<Moeda> {
        let pesquisaMoeda: NSFetchRequest<Moeda> = Moeda.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "assetIDQuote", ascending: true)
        pesquisaMoeda.sortDescriptors = [ordenaPorNome]
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaMoeda, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
            do{
                try gerenciadorDeResultados?.performFetch()
            }catch{
                print(error.localizedDescription)
            }
        
        guard let listaDeMoedas = gerenciadorDeResultados?.fetchedObjects else {return []}
        return listaDeMoedas
    }
    
    func atualizaContexto(){
        do {
            try contexto.save()
                
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func salvaMoeda(dicionarioDeMoeda: Dictionary<String, Any>){
      
        var moeda:NSManagedObject?
        
        
         let id = (dicionarioDeMoeda["assetIDQuote"] as! String)
        
        let moedas = recuperaDadosDaMoeda().filter(){ $0.assetIDQuote  == id }

        if moedas.count > 0{
            guard let moedaSelecionada = moedas.first else {return}
            moeda = moedaSelecionada
        }
        else{
            let entidade = NSEntityDescription.entity(forEntityName: "Moeda", in: contexto)
            moeda = NSManagedObject(entity: entidade!, insertInto: contexto)
        }
        

        moeda?.setValue(dicionarioDeMoeda["assetIDQuote"] as? String, forKey: "assetIDQuote")
        moeda?.setValue(dicionarioDeMoeda["time"] as? String, forKey: "time")
        moeda?.setValue(dicionarioDeMoeda["rate"] as? String, forKey: "rate")
        
        atualizaContexto()
    }
    
    func deletaMoeda(moeda:Moeda){
        contexto.delete(moeda)
        atualizaContexto()
    }

        
}

    

