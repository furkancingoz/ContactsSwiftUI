//
//  HomeViewModel.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 1.04.2024.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var contactsList = [ContactsModel]()
    
    
    let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func loadContacts(){
        db?.open()
        var liste = [ContactsModel]()
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                let kisi = ContactsModel(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                liste.append(kisi)
            }
            
            contactsList = liste
        
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi : String) {
        print("Kişi ara : \(aramaKelimesi)")
    }
    
    func sil(kisiID: Int) {
        print("Kişi sil : \(kisiID)")
    }
}
