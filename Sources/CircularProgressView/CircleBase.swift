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
    var duration: TimeInterval = 120
    public var timer: Timer?

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
        
        timerLabel = UILabel(frame: CGRect(x: self.frame.width/2-25, y: self.frame.height/2-15, width: 50, height: 30))
        timerLabel?.font = UIFont.systemFont(ofSize: 17)
        
        timerLabel?.text = "00:00"
        
        addSubview(timerLabel!)
    }
    
    func startTimer() {
        if timer != nil{
            // timerが起動中なら一旦破棄する
            timer?.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
//        startTime = Date()
    }
    
    func stopTimer(_ sender : Any) {
        timer?.invalidate()
        
//        timerMinute.text = "00"
//        timerSecond.text = "00"
//        timerMSec.text = "00"
    }
 
    @objc func timerCounter() {
        let now = Date()
 
        let fomatter = DateFormatter()
        fomatter.dateFormat = "mm:ss"
        timerLabel?.text = fomatter.string(from: now)
    }
    
    @objc public func handleTap() {
        
        circleView?.progressAnimation(duration: duration)
        startTimer()
    }
}
