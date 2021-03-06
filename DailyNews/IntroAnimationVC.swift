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
    @IBOutlet weak var forDateText: UILabel!
    
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.invertColors()
            }
            firstAnimationDone = true
        }else if timerTime > 1.5 && !secondAnimationDone{
            invertColors()
            newsText.alpha = 0
            dailyText.alpha = 0
            forDateText.isHidden = false
            
            UIView.animate(withDuration: 0.95) { [weak self] in
                self!.forDateText.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
             }
            
            secondAnimationDone = true
        }else if timerTime > 3{
            //Animate to next screen
            timer.invalidate()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainScreen") as! MainScreen
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated:true, completion: { () -> Void in
                self.navigationController?.viewControllers.removeAll()
            })
        }
    }
    
    func moveIt(_ imageView: UILabel,_ speed:CGFloat) {
        let speeds = speed
        UIView.animate(withDuration: TimeInterval(0.5), delay: 0.0, options: .curveLinear, animations: {
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

