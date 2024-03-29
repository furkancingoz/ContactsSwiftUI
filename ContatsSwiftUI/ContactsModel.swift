//
//  ContactsModel.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import Foundation

class ContactsModel : Identifiable {
  var personID : Int?
  var personName : String?
  var personNumber : String?

  init(){}

  init(personID: Int?, personName: String?, personNumber: String) {
    self.personID = personID
    self.personName = personName
    self.personNumber = personNumber
  }

}
