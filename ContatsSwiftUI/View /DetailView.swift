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
var viewModel = DetailViewModel()

  var body: some View {
          VStack{
        TextField("Name",text: $name){

        }.textFieldStyle(.roundedBorder)
          .padding()

        TextField("Phone Number",text: $phoneNumber){

        }.textFieldStyle(.roundedBorder)
          .padding()

        Button("Update"){
          viewModel.update(pID: person.personID!, pName: name, pNumber: phoneNumber)
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

