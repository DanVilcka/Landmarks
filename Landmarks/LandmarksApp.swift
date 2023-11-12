//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Daniil Vilchinskiy on 27.12.2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var model_Data = Model_Data()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model_Data)
        }
#if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
#endif
    }
}
