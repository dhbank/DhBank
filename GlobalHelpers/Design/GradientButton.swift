//
//  GradientButton.swift
//  DhBank
//
//  Created by Lucas on 29/10/21.
//

import UIKit

class GradientButtom: UIButton {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    
    func updatePoints() {
        
        if horizontalMode {
            
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
            
        } else {
            
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
            
        }
        
    }
    
    func updateLocations() {
        
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
        
    }
    
    
    func updateColors() {
        
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
    }
    
    
    override public func layoutSubviews() {
        
        super.layoutSubviews()
        
        updatePoints()
        
        updateLocations()
        
        updateColors()
        
    }
    
}
