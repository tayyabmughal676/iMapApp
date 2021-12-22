//
//  iMapAppApp.swift
//  iMapApp
//
//  Created by Thor on 22/12/2021.
//

import SwiftUI

@main
struct iMapAppApp: App {
    
    @StateObject private var vm = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
