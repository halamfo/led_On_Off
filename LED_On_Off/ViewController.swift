//
//  ViewController.swift
//  LED_On_Off
//
//  Created by Dân Tơi on 6/9/16.
//  Copyright © 2016 Dân Tơi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        let n = 7
        var lastonled = -1
        var timer : NSTimer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        vebong()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningled), userInfo: nil, repeats: true)
    }
    func runningled(){
       if (lastonled != -1)
       {
            turnoffled()
       }
        if (lastonled != n-1)
        {
            lastonled = lastonled + 1
        }
        else{
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(chaynguoc), userInfo: nil, repeats: true)
        }
        turnonled()
    }
    func chaynguoc(){
        if (lastonled != -1)
        {
            turnoffled()
        }
        if (lastonled != 0)
        {
            lastonled = lastonled - 1
        }
        else{
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningled), userInfo: nil, repeats: true)
        }
        turnonled()
    }
    
    func turnonled(){
        if let ball = self.view.viewWithTag(100 + lastonled) as? UIImageView{
            ball.image = UIImage(named: "green")
        }
    }
    func turnoffled(){
        if let ball = self.view.viewWithTag(100 + lastonled) as? UIImageView{
            ball.image = UIImage(named: "grey")
        }
    }

    func vebong(){
        for indexx in 0...n-1{
            for indexy in 0...n-1{
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                ball.center = CGPointMake(20 + CGFloat(indexx) * spacex(), CGFloat(indexy) * spacex()+80)
                ball.tag = indexx + 100
                self.view.addSubview(ball)
            }
        }
    }
    func spacex() ->CGFloat {
        let space = ((self.view.bounds.size.width - 40))/CGFloat(n-1)
        return space
    }
}

