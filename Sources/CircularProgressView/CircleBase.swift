//
//  CircleBase.swift
//  CircularProgressViewExample
//
//  Created by 平塚俊輔 on 2021/09/30.
//

import UIKit

@objc
public class CircleBase: UIView {
    
    var circleView: CircularProgressView?
    var timerLabel: UILabel?
    var duration: TimeInterval = 5
    var timer: Timer?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setCircleView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setCircleView()
    }
    
    public func setCircleView(){
        circleView = CircularProgressView(frame: CGRect(x: self.frame.width/2-35, y: self.frame.height/2-35, width: 70, height: 70))
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        addSubview(circleView!)
        
        timerLabel = UILabel(frame: CGRect(x: self.frame.width/2-30, y: self.frame.height/2-20, width: 50, height: 30))
        
        timerLabel?.text = "00:00"
        
        addSubview(timerLabel!)
    }
    
    @objc public func handleTap() {
        duration = 5    //Play with whatever value you want :]
        circleView?.progressAnimation(duration: duration)
    }
}
