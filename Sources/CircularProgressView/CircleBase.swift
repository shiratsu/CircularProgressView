//
//  CircleBase.swift
//  CircularProgressViewExample
//
//  Created by 平塚俊輔 on 2021/09/30.
//

import UIKit
import AVKit

@objc
public class CircleBase: UIView {
    
    
    
    var circleView: CircularProgressView?
    var timerLabel: UILabel?
    public var duration: TimeInterval = 480
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
//        circleView?.createCircularPath()
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
            timeInterval: 1,
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
//        let now = Date()
        
        duration -= 1
        
        print(duration)
        
        
        let minute = Int(duration / 60)
        let second = Int(duration)  % 60
        
//        print(minute)
//        print(second)
        
        // iぷんだったら
        // 音を鳴らす
        if second == 0{
            playSound()
        }
        
        
        let strSecond: String = (second >= 10) ? String(second) : "0"+String(second)
        
        let strRest = String(minute)+":"+strSecond
        
 
//        let fomatter = DateFormatter()
//        fomatter.dateFormat = strRest
        timerLabel?.text = strRest
    }
    
    @objc public func handleTap() {
        
        circleView?.progressAnimation(duration: duration)
        startTimer()
    }
    
    //１分ごとに音を鳴らす
    private func playSound(){
        AudioServicesPlaySystemSound(1007);
    }
}
