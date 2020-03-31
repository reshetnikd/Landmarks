//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by Dmitry Reshetnik on 30.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList { WatchLandmarkDetail(landmark: $0) }
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
