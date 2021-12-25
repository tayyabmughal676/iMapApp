//
//  LocationView.swift
//  iMapApp
//
//  Created by Thor on 22/12/2021.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack(spacing:0){
                header.padding()
                Spacer()
                ZStack{
                    ForEach(vm.locations){ location in
                        if vm.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(
                                    color: Color.black.opacity(0.3),
                                    radius: 20.0
                                )
                                .padding()
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
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


extension LocationView{
    private var header: some View{
        VStack {
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocation.name + ", " +  vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55.0)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180: 0))
                    }
            }
            if vm.showLocationsList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(
            color: Color.black.opacity(0.3),
            radius: 20.0,
            x: 0,
            y: 15.0
        )
    }
}
