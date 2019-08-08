//
//  HippotifyView.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/4/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit

@IBDesignable
class HippotifyView: UIView {
    
    @IBInspectable
    public var verticalGradient: Bool = true {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable
    public var startColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable
    public var endColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    private var gradientlayer = CAGradientLayer()
    
    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - Layout
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateFrame()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        gradientlayer = CAGradientLayer()
        updateUI()
        layer.insertSublayer(gradientlayer, at: 0)
    }
    
    // MARK: - Update frame
    private func updateFrame() {
        gradientlayer.frame = bounds
    }
    
    // MARK: - Update UI
    private func updateUI() {
        gradientlayer.colors = [startColor.cgColor, endColor.cgColor]
        if verticalGradient {
            gradientlayer.startPoint = CGPoint(x: 0, y: 0)
            gradientlayer.endPoint = CGPoint(x: 0, y: 1)
        } else {
            gradientlayer.startPoint = CGPoint(x: 0, y: 0)
            gradientlayer.endPoint = CGPoint(x: 1, y: 0)
        }
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        if cornerRadius > 0 {
            layer.masksToBounds = true
        }
        updateFrame()
    }
    
}

