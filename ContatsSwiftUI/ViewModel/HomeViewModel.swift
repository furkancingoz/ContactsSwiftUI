//
//  HomeViewModel.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 1.04.2024.
//

import Foundation

class HomeViewModel : ObservableObject {
  @Published var contactsList = [ContactsModel]()

  func loadContacts(){
    var list = [ContactsModel]()
   /*   let name = ContactsModel(personID: 1, personName: "Furkan", kisi_tel: "0541477****")
      let name1 = ContactsModel(personID: 2, kisi: "Sıla", kisi_tel: "0542312****")
    list.append(name)
    list.append(name1)
*/
    contactsList = list
  }
    
    func ara(aramaKelimesi : String) {
        print("Kişi ara : \(aramaKelimesi)")
    }

    func sil(kisiID: Int) {
        print("Kişi sil : \(kisiID)")
    }
}
