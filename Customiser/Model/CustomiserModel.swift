//
//  CustomiserModel.swift
//  Customiser
//
//  Created by Berk Ulas on 22.05.24.
//

import Foundation
import SwiftUI

struct Password: Identifiable,Codable{
    var id = UUID()
    var password: String
    var symbols: Bool
    var upperCase: Bool
    
    var strengthColor: Color {
        var strength = 0
        var color: Color
        
        if symbols {
            strength += 1
        }
        if upperCase {
            strength += 1
        }
        if password.count >= 6 {
            strength += 1
        } else {
            strength -= 1
        }
        
        switch strength{
        case 1 : color = .green
        case 2 : color = .yellow
        case 3 : color = .red
        default : color = .gray
        }
        
        return color
    }
}
