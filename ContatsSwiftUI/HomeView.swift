//
//  ContentView.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct HomeView: View {
  @State private var contactsList = [ContactsModel]()
  var body: some View {
    NavigationStack{
      List{
        ForEach(contactsList) { person in
          NavigationLink(destination: DetailView(person: person)){
            ContactsRow(contacts: person)
          }
        }
      }.navigationTitle("Contacts")
        .toolbar{
          ToolbarItem(placement: .navigationBarTrailing){
            NavigationLink(destination: RegisterView()){
              Image(systemName: "plus")
            }

          }
        }.onAppear{
          var list = [ContactsModel]()
          var name = ContactsModel(personID: 1, personName: "Furkan", personNumber: "0541477****")
          var name1 = ContactsModel(personID: 2, personName: "Sıla", personNumber: "0542312****")
          list.append(name)
          list.append(name1)

         contactsList = list
        }
    }
  }
}

#Preview {
  HomeView()
}
