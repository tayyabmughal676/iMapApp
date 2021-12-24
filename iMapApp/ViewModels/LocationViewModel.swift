//
//  LocationViewModel.swift
//  iMapApp
//
//  Created by Thor on 22/12/2021.
//

import Foundation
import MapKit
import SwiftUI



class LocationViewModel : ObservableObject{
    
    // All Loaded Location
    @Published var locations: [Location]
    
    //    Current location on map
    @Published var mapLocation: Location {
        didSet{
//            Everytime when the location change, map will be update automatically
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion =
    MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(
        latitudeDelta: 0.1,
        longitudeDelta: 0.1)
    
    
    @Published var showLocationsList: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
//    Update Map
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false 
        }
    }
    
}
