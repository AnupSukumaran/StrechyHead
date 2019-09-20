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
    @IBOutlet weak var secondHeader: UIView!
    
    private var lastContentOffset: CGFloat = 0
    let corRadius: CGFloat = 420
    var minCurve: CGFloat = 0
    var maxCurve: CGFloat!
    var scrollMovingUp = false
    // let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.parallaxHeader.view = headerView
        scrollView.parallaxHeader.height = 300
        scrollView.parallaxHeader.mode = .fill
        scrollView.parallaxHeader.minimumHeight = 88
        print("Height = \(headerView.frame.height + 120)")
        secondHeader.layer.cornerRadius = headerView.frame.height + 120
        maxCurve = headerView.frame.height + 120
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: headerView.frame.midX, y: -200), radius: CGFloat(headerView.frame.width), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
//
//
//        shapeLayer.path = circlePath.cgPath
//
//        //change the fill color
//        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        //you can change the stroke color
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        //you can change the line width
//        shapeLayer.lineWidth = 3.0
//
//        headerView.layer.addSublayer(shapeLayer)
        
    }


}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if translation.y > 0 {
          //   print("moveingDown")
             scrollMovingUp = false
            // swipes from top to bottom of screen -> down
        } else {
           //  print("moveingUp")
            scrollMovingUp = true
            // swipes from bottom to top of screen -> up
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = CGFloat(max(-(scrollView.contentOffset.y + scrollView.contentInset.top), 0.0))
//        self.progress = min(max(offsetY / frame.size.height, 0.0), 1.0)
         print("headerView.frame.height = \(headerView.frame.height)")
        let offset = scrollView.contentOffset.y
       // let offset = headerView.frame.height - (y + headerView.frame.height)
  //      let totalScroll: CGFloat = scrollView.contentSize.height - scrollView.bounds.size.height
        
       // let tt = offset / totalScroll
    //    print("totalScroll = \(totalScroll)")
       
        
      //  let offset = scrollView.contentOffset.y
        print("offset = \(offset)")
        if scrollMovingUp {
            //decrease the curve
//            let newVal =  min(max(offset, 0), maxCurve)
//            print("newValUp  \(newVal)")
           // if tt > 0 {
               // print("vall = \(maxCurve / tt)")
            let valUp = max(headerView.frame.height, 0)
            print("valUp = \(valUp)")
            secondHeader.layer.cornerRadius =  valUp
           // secondHeader.layer.cornerRadius = secondHeader.layer.cornerRadius - (maxCurve / totalScroll)
//            UIView.animate(withDuration: 0.5) {
//                self.view.layoutIfNeeded()
//            }
           // }
           
        } else {
           // increase the curve
           // let newVal = min(0, abs(offset) )
          //  print("newValDown  \(newVal)")
           // secondHeader.layer.cornerRadius = newVal
            
            let valDown = min(400, headerView.frame.height)
            print("valDown = \(valDown)")
            secondHeader.layer.cornerRadius =  valDown + (400 - valDown)
//            if headerView.frame.height < 400 {
//
//                secondHeader.layer.cornerRadius =  min(400, headerView.frame.height)
//            } else {
//                 secondHeader.layer.cornerRadius = 400
//            }
            
//            UIView.animate(withDuration: 0.5) {
//                self.view.layoutIfNeeded()
//            }
            
        }
        
    //    secondHeader.layer.cornerRadius = 0
//
//        let offset = scrollView.contentOffset.y
//      //  print("offset = \(offset)")
//
//        if (self.lastContentOffset > offset) {
//            print("moveUp")
//        } else if (self.lastContentOffset < offset) {
//             print("moveDown")
//            // move down
//        }
//
//        // update the new position acquired
//        self.lastContentOffset = scrollView.contentOffset.y
        
//        if offset < 0 {
//            print("increase the Curve = \(offset)")
//            if secondHeader.layer.cornerRadius
//
//        } else {
//            print("Decrease Curve = \(offset)")
//        }
//
        //secondHeader.frame.height =
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: headerView.frame.midX, y: -200), radius: CGFloat(headerView.frame.width), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
//        shapeLayer.path = circlePath.
    }
}

