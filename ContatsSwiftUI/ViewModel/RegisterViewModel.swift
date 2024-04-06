//
//  RegisterViewModel.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 1.04.2024.
//

import Foundation

class RegisterViewModel {
    
    let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }

  func save(kisi_adi: String, kisi_tel: String) {
      db?.open()
      
      do{
          try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES(?,?)", values: [kisi_adi,kisi_tel])
      }catch{
          print(error.localizedDescription)
      }
      db?.close()
     }

}
