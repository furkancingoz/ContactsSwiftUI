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
    var name = ContactsModel(personID: 1, personName: "Furkan", personNumber: "0541477****")
    var name1 = ContactsModel(personID: 2, personName: "Sıla", personNumber: "0542312****")
    list.append(name)
    list.append(name1)

    contactsList = list
  }

}
