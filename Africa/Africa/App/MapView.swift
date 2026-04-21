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
    
    @State private var visibleRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759),
        span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    )
    
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759),
            span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        )
    )
    
    var currentRegion: MKCoordinateRegion? {
        cameraPosition.region
    }
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }//:MAP
        .onMapCameraChange(frequency: .continuous) { context in
            visibleRegion = context.region
        }
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                        Spacer()
                        Text(String(format: "%.4f", visibleRegion.center.latitude))
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                        Spacer()
                        Text(String(format: "%.4f", visibleRegion.center.longitude))
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                }
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .opacity(0.4)
                )
                .padding()
            , alignment: .top
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MapView()
}
