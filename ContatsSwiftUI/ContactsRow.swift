//
//  ContactsRow.swift
//  ContatsSwiftUI
//
//  Created by Furkan Cingöz on 29.03.2024.
//

import SwiftUI

struct ContactsRow: View {

  var contacts = ContactsModel()
    var body: some View {
      VStack(alignment: .leading,spacing: 15){
        Text(contacts.personName!)
          .font(.system(size: 25))
        Text(contacts.personNumber!)
          .font(.system(size: 25))
          .foregroundStyle(.gray)

      }
    }
}

#Preview {
    ContactsRow()
}
