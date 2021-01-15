//
//  IntroAnimationVC.swift
//  DailyNews
//
//  Created by John Baer on 1/15/21.
//

import UIKit

class IntroAnimationVC: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var dailyText: UILabel!
    @IBOutlet weak var newsText: UILabel!
    
    var timer = Timer()
    var timerTime: Float = 0
    var firstAnimationDone = false
    var secondAnimationDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimation()
    }
    
    func startAnimation(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
    }
    
    @objc func animation(){
        timerTime += 0.1
        
        if timerTime < 3 && !firstAnimationDone{
            moveIt(dailyText, 0.5)
            moveIt(newsText, 0.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.invertColors()
            }
            firstAnimationDone = true
        }else if timerTime > 3.5 && !secondAnimationDone{
            
            
            
            secondAnimationDone = true
        }else if timerTime > 6{
            //Animate to next screen
        }
    }
    
    func moveIt(_ imageView: UILabel,_ speed:CGFloat) {
        let speeds = speed
        UIView.animate(withDuration: TimeInterval(0.3), delay: 0.0, options: .curveLinear, animations: {
            imageView.frame.origin.x = self.view.frame.size.width/2 - 75
        }, completion: { (_) in
            self.moveIt(imageView, speeds)
        })
    }
    
    func invertColors(){
        if mainView.backgroundColor == .black{
            mainView.backgroundColor = .systemTeal
            dailyText.textColor = .black
            newsText.textColor = .black
        }else{
            mainView.backgroundColor = .black
            dailyText.textColor = .systemTeal
            newsText.textColor = .systemTeal
        }
    }
    
}

