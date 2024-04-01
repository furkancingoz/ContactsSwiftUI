//
//  Detail.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct DetailView: View {
  @State private var name = ""
  @State private var phoneNumber  = ""

  var person: ContactsModel
     @Binding var contactsList: [ContactsModel]

     func update(pID: Int, pName: String, pNumber: String) {
         // Kişiyi güncelle
         for (index, contact) in contactsList.enumerated() {
             if contact.personID == person.personID {
                 contactsList[index].personName = name
                 contactsList[index].personNumber = phoneNumber
                 break
             }
         }
         print("Güncellendi: \(name) - \(phoneNumber)")
     }


  var body: some View {
    NavigationStack{
      VStack{
        TextField("Name",text: $name){

        }.textFieldStyle(.roundedBorder)
          .padding()

        TextField("Phone Number",text: $phoneNumber){

        }.textFieldStyle(.roundedBorder)
          .padding()

        Button("Update"){
          update(pID: person.personID!, pName: name, pNumber: phoneNumber)
        }
        .padding(15)
        .foregroundStyle(.white)
        .background(Color.blue)
        .cornerRadius(8)
        .padding()


      }.navigationTitle("Detail")
        .onAppear{
          name = person.personName!
          phoneNumber = person.personNumber!
        }
    }
  }
}

