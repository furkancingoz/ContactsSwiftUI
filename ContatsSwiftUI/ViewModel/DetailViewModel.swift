//
//  DetailViewModel.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 1.04.2024.
//

import Foundation

class DetailViewModel  : ObservableObject {
  
  func update(pID : Int, pName: String, pNumber: String) {
    print("Güncellendi: \(pID) - \(pName) - \(pNumber)")
  }

}
