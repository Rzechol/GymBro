//
//  SideMenuOptionView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 19/12/2022.
//

import SwiftUI

struct SideMenuOptionView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing:16) {
            
            Image(systemName: viewModel.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color("pureBlack"))
            
            Text(viewModel.title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color("pureBlack"))
            
            Spacer()
            
        }
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .profile)
    }
}
