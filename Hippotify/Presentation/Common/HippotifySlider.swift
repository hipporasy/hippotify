//
//  HippotifySlider.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/4/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit

class HippotifySlider: UISlider {
    
    private let _trackHeight: CGFloat = 2
    private let _thumbImage = #imageLiteral(resourceName: "ic_oval")
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let _bounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: _bounds.origin.x,
            y: _bounds.origin.y + _bounds.size.height/2 - _trackHeight/2,
            width: _bounds.size.width,
            height: _trackHeight
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    private func prepare() {
        let gradientLayout = CAGradientLayer()
        let frame = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: 5.0 )
        gradientLayout.frame = frame
        gradientLayout.colors = [UIColor.secondary.cgColor, UIColor.primary.cgColor]
        gradientLayout.endPoint = CGPoint(x: 1.0, y:  1.0)
        gradientLayout.startPoint = CGPoint(x: 0.0, y:  1.0)
        UIGraphicsBeginImageContextWithOptions(gradientLayout.frame.size, false, 0.0)
        gradientLayout.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setMinimumTrackImage(image?.resizableImage(withCapInsets:.zero),  for: .normal)
        setThumbImage(_thumbImage, for: .normal)
    }
    
}

