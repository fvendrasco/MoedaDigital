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
        let ordenaPorNome = NSSortDescriptor(key: "assetId", ascending: true)
        pesquisaMoeda.sortDescriptors = [ordenaPorNome]
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaMoeda, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
            do {
                try gerenciadorDeResultados?.performFetch()
            } catch {
                print(error.localizedDescription)
            }
        guard let listaDeMoedas = gerenciadorDeResultados?.fetchedObjects else {return []}
        return listaDeMoedas
    }
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    func salvaMoeda(dicionarioDeMoeda: Dictionary<String, Any>) {
        var moeda:NSManagedObject?
         let id = (dicionarioDeMoeda["assetId"] as! String)
        let moedas = recuperaDadosDaMoeda().filter() { $0.assetId  == id }
        if moedas.count > 0 {
            guard let moedaSelecionada = moedas.first else {return}
            moeda = moedaSelecionada
        } else {
            let entidade = NSEntityDescription.entity(forEntityName: "Moeda", in: contexto)
            moeda = NSManagedObject(entity: entidade!, insertInto: contexto)
        }
        moeda?.setValue(dicionarioDeMoeda["name"] as? String, forKey: "name")
        moeda?.setValue(dicionarioDeMoeda["assetId"] as? String, forKey: "assetId")
        moeda?.setValue(dicionarioDeMoeda["LastMonth"] as? String, forKey: "volumeMonth")
        moeda?.setValue(dicionarioDeMoeda["lastHour"] as? String, forKey: "volumeHour")
        moeda?.setValue(dicionarioDeMoeda["lastDay"] as? String, forKey: "volumeDay")
        moeda?.setValue(dicionarioDeMoeda["price_usd"] as? String, forKey: "price")
        atualizaContexto()
    }
    func deletaMoeda(moeda:MoedaViewData?, moedaSalva: Moeda?) {
        for listaDeMoedas in recuperaDadosDaMoeda() {
            if listaDeMoedas.assetId == moeda?.asset_id {
                contexto.delete(listaDeMoedas)
                atualizaContexto()
            } else if listaDeMoedas.assetId == moedaSalva?.assetId {
                contexto.delete(listaDeMoedas)
                atualizaContexto()
            }
        }
    }
    func verificaMoeda(_ nome: String) -> Bool {
        var moedaExiste = false
        for listaDeMoedas in recuperaDadosDaMoeda() {
            if listaDeMoedas.assetId == nome {
               moedaExiste = true
            }
        }
        return moedaExiste
    }
}
