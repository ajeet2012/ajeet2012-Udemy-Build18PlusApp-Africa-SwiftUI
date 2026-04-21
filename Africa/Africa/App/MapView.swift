//
//  MapView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
       
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759)
        var mapZoomLavel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLavel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        Map(initialPosition: .region(region)) {
            // No overlays or annotations yet
            ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.location) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MapView()
}
