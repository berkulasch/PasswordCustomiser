//
//  ContentViewModel.swift
//  Customiser
//
//  Created by Berk Ulas on 22.05.24.
//

import Foundation
import SwiftUI

extension ContentView{
    
    class ViewModel: ObservableObject {
        @Published  var passwords: [Password] = []
        @Published var symbols = true
        @Published var upperCase = false
        @Published var length = 10
        
        init(){
            createPassword()
        }
        
        func createPassword(){
            let alphabet = "qwertzuiopüasdfghjklöäyxcvbnm"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if symbols {
                base += "°!§$%&/()=?"
            }
            
            if upperCase{
                base += alphabet.uppercased()
            }
            
            for _ in 0..<length {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            
            let password = Password(password: newPassword, symbols: symbols, upperCase: upperCase)
            
            withAnimation{
                passwords.insert(password, at: 0)
            }
            
        }
    }
}
