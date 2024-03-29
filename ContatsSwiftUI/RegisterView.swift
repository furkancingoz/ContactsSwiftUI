//
//  Register.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct RegisterView: View {
  @State private var name = ""
  @State private var phoneNumber  = ""

  func save(personName : String, personNumber: String) {
    print("test \(personName) - \(personNumber)")
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

        Button("Save"){
          save(personName: name, personNumber: phoneNumber)
        }
        .padding(15)
        .foregroundStyle(.white)
        .background(Color.blue)
        .cornerRadius(8)
        .padding()


      }.navigationTitle("Register")
    }
  }
}

#Preview {
  RegisterView()
}
