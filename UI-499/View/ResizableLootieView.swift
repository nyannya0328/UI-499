//
//  ResizableLootieView.swift
//  UI-499
//
//  Created by nyannyan0328 on 2022/03/10.
//

import SwiftUI
import Lottie

struct ResizableLootieView: UIViewRepresentable {
    
    @Binding var lottieView : AnimationView
    
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        addLottieView(to: view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
    
    func addLottieView(to rootView : UIView){
        
        lottieView.backgroundColor = .clear
        lottieView.currentProgress = 0.1
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let contains = [
        
        
            lottieView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: rootView.heightAnchor),
        
        
        ]
        rootView.addSubview(lottieView)
        rootView.addConstraints(contains)
    
        
        
        
    }
    
    
}

