//
//  AnimalModel.swift
//  Africa
//
//  Created by Ajeet Sharma on 20/04/26.
//

import SwiftUI

struct Animal: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var headline: String
    var description: String
    var link: String
    var image: String
    var gallery: [String]
    var facts: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, headline, description, link, image, gallery
        case facts = "fact"
    }
}
