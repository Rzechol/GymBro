//
//  AuthenticationView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State var index = 0
     
     var body: some View {
     
         GeometryReader{ _ in
             
             VStack {
                 
                 Spacer()
                 
                 Image("Logo")
                     .resizable()
                     .frame(width: 80, height: 80)
                 
                 ZStack {
                     
                     SignUpView(index: self.$index)
                         .zIndex(Double(self.index))
                     
                     SignInView(index: self.$index)
                 }
                 
                 HStack(spacing: 15) {
                     
                     Rectangle()
                         .fill(Color("pureUltraLightGray"))
                         .frame(height: 1)
                     
                     Text("OR")
                     
                     Rectangle()
                         .fill(Color("pureUltraLightGray"))
                         .frame(height: 1)
                 }
                 .padding(.horizontal, 30)
                 .padding(.top, 50)
                 
                 HStack(spacing: 25) {
                     
                     Button(action: {
                         
                     }) {
                         Image("appleLogo")
                             .resizable()
                             .renderingMode(.none)
                             .frame(width: 50, height: 50)
                             .clipShape(Circle())
                     }
                     
                     Button(action: {
                         
                     }) {
                         Image("googleLogo")
                             .resizable()
                             .renderingMode(.original)
                             .frame(width: 50, height: 50)
                             .clipShape(Circle())
                     }
                     
                     Button(action: {
                         
                     }) {
                         Image("fbLogo")
                             .resizable()
                             .renderingMode(.original)
                             .frame(width: 50, height: 50)
                             .clipShape(Circle())
                     }
                 }
                 .padding(.top, 30)
                 
                 
                
                 
                 
                Spacer()
             }
             .padding(.vertical)
         }
         .background(RadialGradient(
             gradient:Gradient(colors: [Color("pureLightGray"), Color("pureGray"), Color("pureDarkGray")]),
             center: .center,
             startRadius: 5,
             endRadius: 500
         ))
         .ignoresSafeArea(.all)
         
         
     }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

