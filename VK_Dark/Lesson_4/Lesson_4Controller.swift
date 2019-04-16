//
//  Lesson_4Controller.swift
//  VK_Dark
//
//  Created by Станислав Белых on 12/04/2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import UIKit

class Lesson4ViewController: UIViewController {
  @IBOutlet var myView: Lesson4View!
  
  override func viewDidAppear(_ animated: Bool) {
    
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
      self.myView.filled.toggle()
    }
    
    myView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
    
  }
  
}
@IBDesignable class Lesson4View: UIView {
  
  @IBInspectable public var filled = true {
    didSet {
      setNeedsDisplay()
    }
  }
  
  override func draw(_ rect: CGRect){
    super.draw(rect)
    
    
    guard let context = UIGraphicsGetCurrentContext() else {return}
    
    context.saveGState()
    context.setFillColor(UIColor.green.cgColor)
    let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
    context.fill(rect)
    context.restoreGState()
    
    context.saveGState()
    
    
    let starPath = UIBezierPath()
    starPath.move(to: CGPoint(x: 40, y: 20))
    starPath.addLine(to: CGPoint(x: 45, y: 40))
    starPath.addLine(to: CGPoint(x: 65, y: 40))
    starPath.addLine(to: CGPoint(x: 50, y: 50))
    starPath.addLine(to: CGPoint(x: 60, y: 70))
    starPath.addLine(to: CGPoint(x: 40, y: 55))
    starPath.addLine(to: CGPoint(x: 20, y: 70))
    starPath.addLine(to: CGPoint(x: 30, y: 50))
    starPath.addLine(to: CGPoint(x: 15, y: 40))
    starPath.addLine(to: CGPoint(x: 35, y: 40))
    starPath.close()
    
    context.setStrokeColor(UIColor.red.cgColor)
    starPath.stroke()
    
    
    context.setFillColor(UIColor.orange.cgColor)
    starPath.fill()
  
    if filled {
      starPath.fill()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

    self.layer.cornerRadius = 15
//    layer.masksToBounds = true
    layer.shadowColor = UIColor.red.cgColor
    layer.shadowRadius = 10
    layer.shadowOpacity = 0.7
    layer.shadowOffset = .zero
    
  }
}
