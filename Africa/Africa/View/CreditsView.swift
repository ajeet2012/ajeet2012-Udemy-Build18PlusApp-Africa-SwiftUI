//
//  CreditsView.swift
//  Africa
//
//  Created by Ajeet Sharma on 22/04/26.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
       Copyright © Robert Petras
       All right reserved
       Better Apps ♡ less code   
   """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }// : VSTACK
        .padding()
        .opacity(0.4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
}
