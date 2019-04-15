//
//  GradientView.swift
//  VK_Dark
//
//  Created by Станислав Белых on 13/04/2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {

    
    override static var layerClass: AnyClass {
      return CAGradientLayer.self
    }
    
    public var gradientLayer: CAGradientLayer{
      return self.layer as! CAGradientLayer
    }
    
    @IBInspectable var startColor: UIColor = .white{
      didSet {
        self.updateColor()
      }
    }
    @IBInspectable var endColor: UIColor = .black{
      didSet {
        self.updateColor()
      }
    }
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
          self.updateLocation()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
      didSet {
        self.updateLocation()
      }
    }
    @IBInspectable var startPoint: CGPoint = .zero{
      didSet {
        self.updateStartPoint()
      }
    }
    @IBInspectable var endPoint: CGPoint = .zero{
      didSet {
        self.updateEndPoint()
      }
    }
    
    
    func updateLocation() {
      self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]

    }
    func updateColor(){
            self.gradientLayer.colors = [ self.startColor.cgColor, self.endColor.cgColor]
    }
    func updateStartPoint(){
      self.gradientLayer.startPoint = startPoint
    }
    func updateEndPoint(){
      self.gradientLayer.endPoint = endPoint
    }
  }


