//
//  SignUpVIew.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var user: UserViewModel

    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            VStack {
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("Sign UP")
                            .foregroundColor(self.index == 1 ? Color("pureUltraLightGray") : Color("pureLightGray"))
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color("pureUltraLightGray") : Color.clear)
                            .frame(width: 100, height: 5)
                        
                    }
                }
                .padding(.top, 30)
                
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("pureUltraLightGray"))
                        
                        TextField("", text: $email)
                            .placeholder(when: email.isEmpty) {
                                Text("Email Adress").foregroundColor(Color("pureUltraLightGray"))
                        }
                            .foregroundColor(Color("pureUltraLightGray"))
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "lock.square.fill")
                            .foregroundColor(Color("pureUltraLightGray"))
                        
                        SecureField("", text: $pass)
                             .placeholder(when: pass.isEmpty) {
                                 Text("Password").foregroundColor(Color("pureUltraLightGray"))
                         }
                             .foregroundColor(Color("pureUltraLightGray"))
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "lock.square.fill")
                            .foregroundColor(Color("pureUltraLightGray"))
                        
                        SecureField("", text: $repass)
                             .placeholder(when: repass.isEmpty) {
                                 Text("Password").foregroundColor(Color("pureUltraLightGray"))
                         }
                             .foregroundColor(Color("pureUltraLightGray"))
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
               

            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("pureUltraDarkGray"))
            .clipShape(SignUpShape())
            .contentShape(SignUpShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            
            Button(action: {
                
                if (!email.isEmpty && !pass.isEmpty && !repass.isEmpty ){
                    if pass == repass {
                        user.signUp(email: email, password: pass)
                    }
                    else{
                        user.alertTitle = "Error"
                        user.alertMessage = "Your password and confirmation password do not match"
                        user.showingAlert = true
                    }

                } else {
                    user.alertTitle = "Error"
                    user.alertMessage = "Fields cannot be empty"
                    user.showingAlert = true
                }
                
            }) {
                
                Text("SIGN UP")
                    .foregroundColor(Color("pureUltraDarkGray"))
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("pureUltraLightGray"))
                    .clipShape(Capsule())
                    .shadow(color: Color("pureUltraLightGray").opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
        
    }
}


