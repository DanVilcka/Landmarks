//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Daniil Vilchinskiy on 30.12.2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: Model_Data
    @State private var showFavoriteOnly = true
    
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView(){
            List(){
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(Model_Data())
    }
}
