//
//  ViewController.swift
//  USK-Animations
//
//  Created by Soaurabh Kakkar on 18/07/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var counter = 1;
    var timer = NSTimer()
    var isViewAppeared = false; //viewDidLayoutSubviews, is called on device's screen rotation as well, so to keep a single call for viewDidLayoutSubviews, we need to check this.
    
    @IBAction func updateImage(sender: AnyObject) {
        if let button = sender as? UIButton {
            
            if let buttonTitle = button.titleLabel?.text {
                if buttonTitle == "Start Animation" {
                    timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.startAnimation), userInfo: nil, repeats: true);
                    button.setTitle("Stop Animation", forState: UIControlState.Normal)
                } else {
                    timer.invalidate()
                    imageView.image = UIImage(named: "frame1.png")
                    button.setTitle("Start Animation", forState: UIControlState.Normal)
                }
            }
        }
    }
    
    func startAnimation() {
        if counter > 5 {
            counter = 1
        }
        imageView.image = UIImage(named: "frame\(counter).png")
        counter += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if isViewAppeared == false {
            imageView.center = CGPointMake(imageView.center.x - 400, imageView.center.y)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        isViewAppeared = true 
        UIView.animateWithDuration(1) { 
            self.imageView.center = CGPointMake(self.imageView.center.x + 400, self.imageView.center.y)
        }
    }
    
    
    // Animate from left/right/top/bottom
    /*
     override func viewDidLayoutSubviews() {
     //Called to notify the view controller that its view has just laid out its subviews.(called on device's screen rotation as well, because the view's Layout changes in that case)
     //Called just before the view is actually displayed
        if isViewAppeared == false {
            myImageView.center = CGPointMake(myImageView.center.x - 400, myImageView.center.y) // Based on the same code we can animate from left/right/top/bottom(i.e just need to add/subtract 400 or larger number from x or y resp.)
        }
     }
     
     
     override func viewDidAppear(animated: Bool) {
     //Called just when the view appears
        isViewAppeared = true
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.myImageView.center = CGPointMake(self.myImageView.center.x + 400, self.myImageView.center.y)
        })
     }
     */
    
    /*   // fade-in animation
     override func viewDidLayoutSubviews() {
     //Called to notify the view controller that its view has just laid out its subviews.(called on device's screen rotation as well, because the view's Layout changes in that case)
     //Called just before the view is actually displayed
        if isViewAppeared == false {
            myImageView.alpha = 0 //invisible
        }
     }
     
     override func viewDidAppear(animated: Bool) {
     //Called just when the view appears
        isViewAppeared = true
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.myImageView.alpha = 1 //completely-visible
        })
     }
     */
    
    /*
     // changing the object's-size and we can also use this to change the location as well
     override func viewDidLayoutSubviews() {
     //Called to notify the view controller that its view has just laid out its subviews.(called on device's screen rotation as well, because the view's Layout changes in that case)
     //Called just before the view is actually displayed
        if isViewAppeared == false {
            myImageView.frame = CGRectMake(100,20, 0, 0)
        }
     }
     
     override func viewDidAppear(animated: Bool) {
     //Called just when the view appears
        isViewAppeared = true
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.myImageView.frame = CGRectMake(100, 20, 100, 200)
        })
     }
     
     */
    
}

