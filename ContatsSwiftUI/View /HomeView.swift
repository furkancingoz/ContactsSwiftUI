//
//  ContentView.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var searchWord = ""
    @ObservedObject var viewModel = HomeViewModel()
    
    func sil(at offsets:IndexSet){
        let p = viewModel.contactsList[offsets.first!]
        viewModel.contactsList.remove(at: offsets.first!)
        viewModel.sil(kisiID: p.kisi_id!)
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.contactsList) { person in
                    NavigationLink(destination: DetailView(person: person)){
                        ContactsRow(contacts: person)
                    }
                }.onDelete(perform: sil)
            }.navigationTitle("Contacts")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: RegisterView()){
                            Image(systemName: "plus")
                        }
                        
                    }
                }.onAppear{
                    viewModel.loadContacts()
                    veritabanıKopyala()
                    print("ana sayfa dönüldü")
                }
        }.searchable(text: $searchWord, prompt: "Ara")
            .onChange(of: searchWord) { s  in
                viewModel.ara(aramaKelimesi: s)
            }
        
    }
    func veritabanıKopyala(){
        let bundle = Bundle.main.path(forResource: "kisiler", ofType: ".sqlite")
        
    }
}
#Preview {
    HomeView()
}
