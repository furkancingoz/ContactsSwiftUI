//
//  Register.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct RegisterView: View {
  var viewModel = RegisterViewModel()
  @State private var name = ""
  @State private var phoneNumber  = ""

  var body: some View {
    VStack(spacing: 50){
        TextField("Name",text: $name){

        }.textFieldStyle(.roundedBorder)
          .padding()

        TextField("Phone Number",text: $phoneNumber){

        }.textFieldStyle(.roundedBorder)
          .padding()

        Button("Save"){
          viewModel.save(personName: name, personNumber: phoneNumber)
        }
        .padding(15)
        .foregroundStyle(.white)
        .background(Color.blue)
        .cornerRadius(8)
        .padding()


      }.navigationTitle("Register")
  }
}

