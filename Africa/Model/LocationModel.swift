//
//  LocationModel.swift
//  Africa
//
//  Created by Nicolai Bodean on 04.12.2023.
//

import Foundation
import MapKit

struct NationalParklocation: Codable, Identifiable {
    let id:        String
    let name:      String
    let image:     String
    let latitude:  Double
    let longitude: Double
    
    
    // Computed property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}
