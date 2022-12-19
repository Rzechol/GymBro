//
//  SideMenuHeaderView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 19/12/2022.
//

import SwiftUI

struct SideMenuHeaderView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: { withAnimation(.spring()) {
                isShowing.toggle()
            } }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            
            VStack(alignment: .leading) {
                Image("profileImage")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                    .shadow(color: Color("pureBlack"), radius: 10, x: 0, y: 8)
                
                Text("Użytkownik FitAM")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("@TwojaStara")
                    .font(.system(size: 14))
                
                HStack() {
                    Spacer()
                }
                
                
                
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
