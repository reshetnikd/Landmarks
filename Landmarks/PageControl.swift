//
//  PageControl.swift
//  Landmarks
//
//  Created by Dmitry Reshetnik on 29.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    class Coordinator: NSObject {
        var control: PageControl
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
        
        init(_ control: PageControl) {
            self.control = control
        }
    }
    
    @Binding var currentPage: Int
    var numberOfPages: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}
