//
//  CenterModifier.swift
//  Africa
//
//  Created by Ajeet Sharma on 22/04/26.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
