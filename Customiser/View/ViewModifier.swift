//
//  ViewModifier.swift
//  Customiser
//
//  Created by Berk Ulas on 22.05.24.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View{
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigation(title: String) -> some View{
        NavigationView{
            self
                .navigationTitle(title)
        }
    }
}


