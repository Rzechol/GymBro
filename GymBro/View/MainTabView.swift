//
//  MainTabView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 19/12/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectIndex = 0
    @State private var title = "FitAM"
  
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("pureUltraLightGray"))
    }
    
    var body: some View {
        
        TabView(selection: $selectIndex) {
            
            
            
            Color.red
                .onAppear{
                    title = "Atlas Ćwiczeń"
                }
                .onTapGesture {
                    self.selectIndex = 2
                }
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                }.tag(2)
                
            
            Color.brown
                .onAppear{
                    title = "Plan Treningowy"
                }
                .onTapGesture {
                    self.selectIndex = 1
                }
                .tabItem {
                    Image(systemName: "calendar")
                }.tag(1)
            
            Color.yellow
                .onAppear{
                    title = "FitAM"
                }
                .onTapGesture {
                    self.selectIndex = 0
                }
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(0)
            
            Color.green
                .onAppear{
                    title = "Nawodnienie"
                }
                .onTapGesture {
                    self.selectIndex = 3
                }
                .tabItem {
                    Image(systemName: "drop.fill")
                }.tag(3)
                
            
            Color.blue
                .onAppear{
                    title = "Dieta"
                }
                .onTapGesture {
                    self.selectIndex = 4
                }
                .tabItem {
                    Image(systemName: "carrot.fill")                }
                .tag(4)
                
                
            
                
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all)
        .accentColor(Color("pureUltraDarkGray"))
        
        
      
        
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
