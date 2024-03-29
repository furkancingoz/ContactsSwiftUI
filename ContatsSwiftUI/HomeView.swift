//
//  ContentView.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      NavigationStack{
        List{

        }.navigationTitle("Contacts")
          .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
              NavigationLink(destination: RegisterView()){
                Image(systemName: "plus")
              }

            }
          }
      }
    }
}

#Preview {
    HomeView()
}
