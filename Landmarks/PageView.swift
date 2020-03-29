//
//  PageView.swift
//  Landmarks
//
//  Created by Dmitry Reshetnik on 29.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    @State var currentPage = 0
    var viewControllers: [UIHostingController<Page>]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(currentPage: $currentPage, controllers: viewControllers)
            PageControl(currentPage: $currentPage, numberOfPages: viewControllers.count)
                .padding(.trailing)
        }
    }
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
