//
//  ViewController.swift
//  CircularProgressViewExample
//
//  Created by 平塚俊輔 on 2021/09/26.
//

import UIKit
import CircularProgressView

class ViewController: UIViewController {
    
    // MARK: - Outlets -
        
    @IBOutlet weak var animatedCountingLabel: UILabel!

    // MARK: - Properties -

    @IBOutlet weak var containerView: UIView!
    var circularView: CircularProgressView!
    var duration: TimeInterval!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circularView = CircularProgressView()
        circularView.frame = CGRect(x: 10, y: 10, width: 70, height: 70)
        circularView.createCircularPath()
        circularView.center = view.center
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        view.addSubview(circularView)
    }
    
    @objc func handleTap() {
        duration = 5    //Play with whatever value you want :]
        circularView.progressAnimation(duration: duration)
    }


}

