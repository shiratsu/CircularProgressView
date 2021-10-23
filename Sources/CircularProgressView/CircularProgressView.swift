//
//  CircularProgressView.swift
//  CircularProgressView
//
//  Created by 平塚俊輔 on 2021/09/26.
//

import UIKit

@objc
public class CircularProgressView: UIView {

    // MARK: - Properties -
    

    public var circleStrokeColor: UIColor = UIColor.black
    public var progressStrokeColor: UIColor = UIColor.red
    
    public var circleLayer = CAShapeLayer()
    public var progressLayer = CAShapeLayer()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
//        createCircularPath()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        createCircularPath()
    }
    public func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20.0
        circleLayer.strokeColor = circleStrokeColor.cgColor
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = progressStrokeColor.cgColor
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressLayer)
    }
    public func progressAnimation(duration: TimeInterval) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }

}
