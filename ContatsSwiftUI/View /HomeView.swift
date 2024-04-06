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
                    veritabanıKopyala()
                    viewModel.loadContacts()
                    print("ana sayfa dönüldü")
                }
        }.searchable(text: $searchWord, prompt: "Ara")
            .onChange(of: searchWord) { s,s2  in
                viewModel.ara(aramaKelimesi: s)
            }
        
    }
    func veritabanıKopyala(){
        let bundle = Bundle.main.path(forResource: "kisiler", ofType: ".sqlite")
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path) {
            print("veri tabanı daha önce kopyalandı")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
#Preview {
    HomeView()
}
