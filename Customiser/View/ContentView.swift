//
//  ContentView.swift
//  Customiser
//
//  Created by Berk Ulas on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form{
            Section("Options"){
                Toggle("Symbols", isOn: $vm.symbols)
                Toggle("UpperCase", isOn:$vm.upperCase)
                Stepper("Character counter: \(vm.length)", value: $vm.length,in:6...18)
                Button("Generate", action: vm.createPassword)
                    .centerH()
                    
            }
            Section("Passwords"){
                List (vm.passwords){
                    password in HStack{
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                    }
                }
            }
            
        }
        .addNavigation(title: "Passwords")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
