//
//  LocationView.swift
//  iMapApp
//
//  Created by Thor on 22/12/2021.
//

import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) {
                Text($0.name)
                Text($0.cityName)
                Text($0.description)
                Spacer()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
