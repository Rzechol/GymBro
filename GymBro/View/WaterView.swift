//
//  WaterView.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import SwiftUI

struct WaterView: View {
    var body: some View {
        VStack{
            Rectangle()
                .padding()
                .frame(height: 200)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .backgroundStyle(LinearGradient(gradient: Gradient(colors: [Color("pureUltraLightGray"),Color("pureLightGray"),Color("pureDarkGray"),]), startPoint: .top, endPoint: .bottom)
)
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}
