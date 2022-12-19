//
//  SideMenuViewModel.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 19/12/2022.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    
    case profile
    case measurement
    case achievements
    case settings
    case logout
    
    var title: String {
        switch self {
        case .profile: return "Profil"
        case .measurement: return "Pomiary"
        case .achievements: return "Osiągnięcia"
        case .settings: return "Ustawienia"
        case .logout: return "Wyloguj"
            
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person.circle.fill"
        case .measurement: return "ruler.fill"
        case .achievements: return "medal.fill"
        case .settings: return "gearshape"
        case .logout: return "arrow.backward.square"
            
        }
    }
    

}
