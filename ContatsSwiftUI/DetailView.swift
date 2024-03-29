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

  func update(pID: Int, pName : String, pNumber: String) {
    print("test \(pName) - \(pNumber)")
  }

  var person = ContactsModel()

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
          update(pID: person.personID!, pName: person.personName!, pNumber: person.personNumber!)
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

#Preview {
    DetailView()
}
