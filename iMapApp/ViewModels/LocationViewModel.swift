//
//  LocationViewModel.swift
//  iMapApp
//
//  Created by Thor on 22/12/2021.
//

import Foundation


class LocationViewModel : ObservableObject{
    
    @Published var locations: [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }

}
