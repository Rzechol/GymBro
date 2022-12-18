//
//  TestView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        
        Button {
            user.signOut()
        } label: {
            Image(systemName: "person")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
