//
//  ViewController.swift
//  AnimationAndDraw
//
//  Created by Nikolas Omelianov on 23.02.18.
//  Copyright © 2018 Nikolas Omelianov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        	let center = view.center
        	let trakLayer = CAShapeLayer()
        	let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
            trakLayer.path = circularPath.cgPath
            trakLayer.strokeColor = UIColor.lightGray.cgColor
            trakLayer.lineWidth = 10
            trakLayer.fillColor = UIColor.clear.cgColor
            trakLayer.lineCap = kCALineCapRound
            view.layer.addSublayer(trakLayer)
    
            shapeLayer.path = circularPath.cgPath
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineCap = kCALineCapRound
        
            shapeLayer.strokeEnd = 0
            view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
 
    
    
}

