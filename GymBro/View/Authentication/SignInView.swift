//
//  SignInView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    @State var email = ""
    @State var pass = ""
    
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            VStack {
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("Sign In")
                            .foregroundColor(Color("pureUltraLightGray"))
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color("pureUltraLightGray") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
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
                                Text("Password")
                                
                                    .foregroundColor(Color("pureUltraLightGray"))
                        }
                            .foregroundColor(Color("pureUltraLightGray"))
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                
                HStack{
                    
                    Spacer(minLength: 6)
                    
                    Button(action: {
                        
                    }) {
                        Text("Forget Password ?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)

            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("pureUltraDarkGray"))
            .clipShape(SignInShape())
            .contentShape(SignInShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            
            Button(action: {
                
                if (!email.isEmpty && !pass.isEmpty){
                    user.signIn(email: email, password: pass)
                } else{
                    user.alertTitle = "Error"
                    user.alertMessage = "Fields cannot be empty"
                    user.showingAlert = true
                }
                
            }) {
                
                Text("Sign In")
                    .foregroundColor(Color("pureUltraDarkGray"))
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("pureUltraLightGray"))
                    .clipShape(Capsule())
                    .shadow(color: Color("pureUltraLightGray").opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
        
    }
}

