//
//  SideMenuView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 19/12/2022.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("pureUltraLightGray"),Color("pureLightGray"),Color("pureDarkGray"),]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                
                // MARK: - Header
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height:170)
                
                // MARK: - Option
              
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}

