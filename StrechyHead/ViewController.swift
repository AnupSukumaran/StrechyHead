//
//  ViewController.swift
//  StrechyHead
//
//  Created by Qaptive Technologies on 19/09/19.
//  Copyright © 2019 Qaptive Technologies. All rights reserved.
//

import UIKit
import MXParallaxHeader

class ViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var secondHeader: ArcLayer!
    @IBOutlet weak var secondHeaderHeight: NSLayoutConstraint!
    
    private var lastContentOffset: CGFloat = 0
    let corRadius: CGFloat = 420
    var minCurve: CGFloat = 0
    var maxCurve: CGFloat!
    var scrollMovingUp = false
    var lastVelocityYSign = 0
    var path: UIBezierPath!
    var shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.parallaxHeader.view = headerView
        scrollView.parallaxHeader.height = 300
        scrollView.parallaxHeader.mode = .fill
        scrollView.parallaxHeader.minimumHeight = 88
        createRectangle(arcHeight: 25.0)
        
    }
    
    func createRectangle(arcHeight: CGFloat) {
        
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: secondHeader.frame.size.height/2))
    
        let geo = archHeightRadiusCreator(recWidth: secondHeader.frame.size.width, arcHeight: arcHeight)
        let xAxis = secondHeader.frame.size.width/2
        let yAxis = secondHeader.frame.size.height - geo.radius

        path.addArc(withCenter: CGPoint(x: xAxis, y: yAxis), radius:  geo.radius, startAngle: geo.startAngle.degreesToRadians, endAngle: geo.endAngle.degreesToRadians, clockwise: false)

        path.addLine(to: CGPoint(x: secondHeader.frame.size.width, y: 0.0))
        
        path.close()
        
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        shapeLayer.shadowOpacity = 1.0
        shapeLayer.shadowRadius = 5.0
        shapeLayer.shouldRasterize = true
        shapeLayer.rasterizationScale = UIScreen.main.scale
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        secondHeader.layer.addSublayer(shapeLayer)
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

}

extension ViewController: UIScrollViewDelegate {
       
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        secondHeaderHeight.constant = headerView.frame.height

        let currentVelocityY =  scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y
        let currentVelocityYSign = Int(currentVelocityY).signum()
        
        if currentVelocityYSign != lastVelocityYSign && currentVelocityYSign != 0 {
               lastVelocityYSign = currentVelocityYSign
        }
        
        if lastVelocityYSign < 0 {
           
            if (headerView.frame.height/12) <= 8 {
                createRectangle(arcHeight: 1)
            } else {
                createRectangle(arcHeight: headerView.frame.height/12)
            }
            
         
        } else if lastVelocityYSign > 0 {

             if (headerView.frame.height/12) >= 8 {
                createRectangle(arcHeight: (headerView.frame.height/12))
             } else {
                createRectangle(arcHeight: 1)
             }
            
        }
        

    }
}

