//
//  ContentView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserViewModel
    
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
                
               TestView()
            
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

