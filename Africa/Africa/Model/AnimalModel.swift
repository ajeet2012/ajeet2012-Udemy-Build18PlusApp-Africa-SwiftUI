//
//  AnimalModel.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    var description: String
    var link: String
    var image: String
    var gallery: [String]
    var fact: [String]
}
