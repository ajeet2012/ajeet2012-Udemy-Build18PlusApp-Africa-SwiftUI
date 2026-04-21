//
//  LocationModel.swift
//  Africa
//
//  Created by Ajeet Sharma on 21/04/26.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable, Hashable {
    
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
