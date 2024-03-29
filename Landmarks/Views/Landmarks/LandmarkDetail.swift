//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Daniil Vilchinskiy on 30.12.2022.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var Model_Data: Model_Data
    var landmark: Landmark
    
    var landmarkindex: Int{
        Model_Data.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack{
                
                HStack{
                    Text(landmark.name)
                                        .font(.title)
                    FavoriteButton(isSet: $Model_Data.landmarks[landmarkindex].isFavorite)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let model_Data = Model_Data()
    
    static var previews: some View {
        LandmarkDetail(landmark: Model_Data().landmarks[0]).environmentObject(model_Data)
    }
}
