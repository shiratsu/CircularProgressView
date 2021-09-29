//
//  CircleBase.swift
//  CircularProgressViewExample
//
//  Created by 平塚俊輔 on 2021/09/30.
//

import UIKit

public class CircleBase: UIView {
    
    var circleView: CircularProgressView?
    var duration: TimeInterval = 5

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setCircleView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setCircleView()
    }
    
    public func setCircleView(){
        circleView = CircularProgressView(frame: CGRect(x: 10, y: 10, width: 70, height: 70))
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        addSubview(circleView!)
    }
    
    @objc public func handleTap() {
        duration = 5    //Play with whatever value you want :]
        circleView?.progressAnimation(duration: duration)
    }
}
