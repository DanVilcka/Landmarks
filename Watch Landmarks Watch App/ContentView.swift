//
//  ContentView.swift
//  Watch Landmarks Watch App
//
//  Created by Daniil Vilchinskiy on 19.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model_Data())
    }
}
