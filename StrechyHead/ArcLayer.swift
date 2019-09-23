//
//  ArcLayer.swift
//  StrechyHead
//
//  Created by Qaptive Technologies on 20/09/19.
//  Copyright © 2019 Qaptive Technologies. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class ArcLayer: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //complexShape()
        createRectangle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
   //     fatalError("init(coder:) has not been implemented")
        createRectangle()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
//        complexShape()
        createRectangle()
    }
    
    func createRectangle() {
        
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height/2))
    
        let geo = archHeightRadiusCreator(recWidth: self.frame.size.width, arcHeight: 50.0)
        
        path.addArc(withCenter: CGPoint(x:self.frame.size.width/2 , y:  self.frame.size.height - geo.radius
        ), radius:  geo.radius, startAngle: geo.startAngle.degreesToRadians, endAngle: geo.endAngle.degreesToRadians, clockwise: false)

        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        layer.addSublayer(shapeLayer)
    }
    
    //MARK:Theorems Used - Intersecting Chord theorm and Pythagorus theorem 
    func archHeightRadiusCreator(recWidth: CGFloat,arcHeight: CGFloat) -> (radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        
        let lhs = pow(recWidth/2, 2)
        let d = lhs / arcHeight
        let diameter = d + arcHeight
        let radius = diameter/2
        let endAngle = acos((recWidth / 2) / radius).radiansToDegrees
        let startAngle = CGFloat.pi.radiansToDegrees - endAngle

        return (radius,startAngle,endAngle)
    }
    
//    func complexShape() {
//
//
//        path = UIBezierPath()
//        path.move(to: CGPoint(x: 0.0, y: 17.0))
//
//        path.addArc(withCenter: CGPoint(x: 17 , y: 17.0),radius: 17.0,startAngle: CGFloat(180.0).degreesToRadians,endAngle: CGFloat(270.0).degreesToRadians,clockwise: true)
//
//
//        path.addArc(withCenter: CGPoint(x: self.frame.size.width - 17 , y: 17.0),radius: 17.0,startAngle: CGFloat(270.0).degreesToRadians, endAngle: CGFloat(0.0).degreesToRadians, clockwise: true)
//
//
//        path.addArc(withCenter: CGPoint(x: self.frame.size.width - 17, y: self.frame.size.height - 17.0), radius: 17.0, startAngle: CGFloat(0.0).degreesToRadians, endAngle: CGFloat(120.0).degreesToRadians, clockwise: true)
//
//
//        path.addArc(withCenter: CGPoint(x: 17, y:  self.frame.size.height/2 + 115), radius: 17.0, startAngle: CGFloat(120.0).degreesToRadians, endAngle: CGFloat(180.0).degreesToRadians, clockwise: true)
//
//        path.close()
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//
//        shapeLayer.shadowColor = UIColor.black.cgColor
//        shapeLayer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        shapeLayer.shadowOpacity = 1.0
//        shapeLayer.shadowRadius = 5.0
//        shapeLayer.shouldRasterize = true
//        shapeLayer.rasterizationScale = UIScreen.main.scale
//
//        layer.rasterizationScale = UIScreen.main.scale
//        shapeLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        layer.addSublayer(shapeLayer)
//    }
    
    
//    func createRectangle() {
//
//        path = UIBezierPath()
//        path.move(to: CGPoint(x: 0.0, y: 0.0))
//        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
//
//        path.addArc(withCenter: CGPoint(x: 0.0, y: self.frame.size.height ), radius: 17.0, startAngle: CGFloat(0.0).degreesToRadians, endAngle: CGFloat(120.0).degreesToRadians, clockwise: false)
//
//        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
//        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
//        path.close()
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
//        layer.addSublayer(shapeLayer)
//    }


}
