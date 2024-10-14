//
//  Alerts.swift
//  ChefDelivery
//
//  Created by lgc on 10/10/24.
//

import SwiftUI

struct Error: Identifiable {
    var id: String
    var message: String
}


struct ErrorAlert: View {
    @State private var error: Error?
    
    var body: some View {
        
        Text("Hellouu")
//        Button(action: {
//            error = Error(id: "ID-E01", message: "Algo deu errado")
//        }){
//            Text("Texto do botão")
//        }.alert(item: $error) { error in
////            Alert()
//            
//        }
    }
    
}

#Preview {
    ErrorAlert()
}
