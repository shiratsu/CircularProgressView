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

    var circularProgressView: CircularProgressView!
    var circularViewDuration: TimeInterval = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
        // set view
        circularProgressView = CircularProgressView(
            // align to the center of the screen
//        circularProgressView.center = view.center
            // call the animation with circularViewDuration
        circularProgressView.progressAnimation(duration: circularViewDuration)
            // add this view to the view controller
//            view.addSubview(circularProgressView)
    }


}

