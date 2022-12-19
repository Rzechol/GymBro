//
//  ContentView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserViewModel
    
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            if user.userIsAuthenticated && !user.userIsAuthenticatedAndSynced {
                VStack(alignment: .center){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white)).frame(alignment: .center).scaleEffect(3).padding()
                    
                    Text("Loading").font(.system(size: 25)).padding()
                }
                
            }
            else if user.userIsAuthenticatedAndSynced{
                
                ZStack{
                    if isShowing {
                        SideMenuView(isShowing: $isShowing)
                    }
                    MainTabView()
                        .cornerRadius(isShowing ? 20 : 10)
                        .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                        .scaleEffect(isShowing ? 0.8 : 1)
                        .blur(radius: isShowing ? 3 : 0)
                        .navigationBarItems(leading: Button(action: {
                            withAnimation(.spring()) {
                                isShowing.toggle()
                            }
                        }, label: {Image(systemName: "list.bullet.below.rectangle")
                        }))
                        .navigationTitle("FitAM")
                        .navigationBarTitleDisplayMode(.inline)
                        .edgesIgnoringSafeArea(.bottom)
                    
                }
                .onAppear{
                    isShowing = false
                    
                }
            }
            else{
                AuthenticationView()
            }
        }
        .onAppear{
            if user.userIsAuthenticated{
                user.sync()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

