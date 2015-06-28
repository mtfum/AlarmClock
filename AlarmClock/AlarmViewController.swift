//
//  ViewController.swift
//  AlarmClock
//
//  Created by Fumiya Yamanaka on 2015/06/22.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit
import AVFoundation

protocol AlarmViewConrtrollerDelegate {
    func alarmText(text: String)
}

class AlarmViewController: UIViewController , AlarmViewConrtrollerDelegate, AVAudioPlayerDelegate {
    
    let myButton0 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton1 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton2 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton3 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton4 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton5 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton6 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton7 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton8 = UIButton(frame: CGRectMake(0,0,90,90))
    
    var random:Int = 0
    var correctAnser:Int = 0
    var myAudioPlayer: AVAudioPlayer!    //変数宣言

    func colorChange() {
        random = Int(arc4random()%9) //0~8(9つ)の乱数発生
        switch random {
        case 0:
            myButton0.layer.borderColor = UIColor.greenColor().CGColor
            myButton0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton0.backgroundColor = UIColor.greenColor()
        case 1:
            myButton1.layer.borderColor = UIColor.greenColor().CGColor
            myButton1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton1.backgroundColor = UIColor.greenColor()
        case 2:
            myButton2.layer.borderColor = UIColor.greenColor().CGColor
            myButton2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton2.backgroundColor = UIColor.greenColor()
        case 3:
            myButton3.layer.borderColor = UIColor.greenColor().CGColor
            myButton3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton3.backgroundColor = UIColor.greenColor()
        case 4:
            myButton4.layer.borderColor = UIColor.greenColor().CGColor
            myButton4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton4.backgroundColor = UIColor.greenColor()
        case 5:
            myButton5.layer.borderColor = UIColor.greenColor().CGColor
            myButton5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton5.backgroundColor = UIColor.greenColor()
        case 6:
            myButton6.layer.borderColor = UIColor.greenColor().CGColor
            myButton6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton6.backgroundColor = UIColor.greenColor()
        case 7:
            myButton7.layer.borderColor = UIColor.greenColor().CGColor
            myButton7.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton7.backgroundColor = UIColor.greenColor()
        case 8:
            myButton8.layer.borderColor = UIColor.greenColor().CGColor
            myButton8.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton8.backgroundColor = UIColor.greenColor()
        default :
            break
        }
    }
    
    func colorDefault() {
        
        switch random {
        case 0:
            myButton0.layer.borderColor = UIColor.blueColor().CGColor
            myButton0.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton0.backgroundColor = UIColor.blueColor()
        case 1:
            myButton1.layer.borderColor = UIColor.blueColor().CGColor
            myButton1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton1.backgroundColor = UIColor.blueColor()
        case 2:
            myButton2.layer.borderColor = UIColor.blueColor().CGColor
            myButton2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton2.backgroundColor = UIColor.blueColor()
            
        case 3:
            myButton3.layer.borderColor = UIColor.blueColor().CGColor
            myButton3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton3.backgroundColor = UIColor.blueColor()
        case 4:
            myButton4.layer.borderColor = UIColor.blueColor().CGColor
            myButton4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton4.backgroundColor = UIColor.blueColor()
        case 5:
            myButton5.layer.borderColor = UIColor.blueColor().CGColor
            myButton5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton5.backgroundColor = UIColor.blueColor()
        case 6:
            myButton6.layer.borderColor = UIColor.blueColor().CGColor
            myButton6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton6.backgroundColor = UIColor.blueColor()
        case 7:
            myButton7.layer.borderColor = UIColor.blueColor().CGColor
            myButton7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton7.backgroundColor = UIColor.blueColor()
        case 8:
            myButton8.layer.borderColor = UIColor.blueColor().CGColor
            myButton8.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton8.backgroundColor = UIColor.blueColor()
        default :
            break
        }
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        self.timeLabel()
        
        self.myButtonAction0()
        self.myButtonAction1()
        self.myButtonAction2()
        self.myButtonAction3()
        self.myButtonAction4()
        self.myButtonAction5()
        self.myButtonAction6()
        self.myButtonAction7()
        self.myButtonAction8()
        
        self.audio()
        
        println(random)
        
        self.colorChange()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func audio() {
        //再生する音源のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("Spring_In_My_Step", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        // AVAudioPlayerのインスタンス化
        myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        myAudioPlayer.play()
        //        myAudioPlayer.delegate = self // デリゲートセット
        
    }
    
    //soundボタンがタップされた時に呼ばれるメソッド.
    func onClickSoundStopButton(sender: UIButton) {
        if correctAnser < 4 {
            if random == sender.tag {
                correctAnser++
            } else {
                var volume = myAudioPlayer.volume + 0.2
                if volume > 1.0 {
                    volume = 1.0
                }
                myAudioPlayer.volume = volume
            }
            colorDefault()
            colorChange()
        } else {
            colorDefault()
            myAudioPlayer.pause()
            
//            var targetView: AnyObject self.storyboard!.instantiateViewControllerWithIdentifier( "welcome" )
            
//            self.presentViewController( targetView as UIViewController, animated: true, completion: nil)
        }
         println(correctAnser)
    }
    
    internal func finishAlarmButton(sender: UIButton){
        // 遷移するViewを定義する.
        let myMainViewController: UIViewController = mainViewController()
        // アニメーションを設定する.
        myMainViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        // Viewの移動する.
        self.presentViewController(myMainViewController, animated: true, completion: nil)
    }
    
    
    var timeSetLabel: UILabel = UILabel(frame: CGRectMake(50, 50, 250, 200))

    func timeLabel() {
        timeSetLabel.text = "6/28 6:00"
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.textColor = UIColor.purpleColor()
        timeSetLabel.backgroundColor = UIColor.clearColor()
        timeSetLabel.font = UIFont.systemFontOfSize(50)
        timeSetLabel.layer.masksToBounds = true
        timeSetLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 150)
        
        self.view.addSubview(timeSetLabel)
        
    }
    // sleepButton押下時の処理、delegateメソッドを呼び出すメソッド
//    func openSleepButton(sender: UIButton) {
//        var myMainViewController = mainViewController()
//        myMainViewController.delegate = self
//        var controller = UINavigationController(rootViewController: myMainViewController)
//        self.presentViewController(controller, animated: true, completion: nil)
//    }
    
    // delegateで使用するメソッド
    func alarmText(text: String) {
        timeSetLabel.text = text
    }
    
    func myButtonAction0() {
        myButton0.backgroundColor = UIColor.blueColor()
        myButton0.layer.position = CGPoint(x: self.view.bounds.width/4,y: self.view.bounds.height - 300)

        myButton0.layer.masksToBounds = true
        myButton0.layer.cornerRadius = 10
        myButton0.layer.borderWidth = 5
        myButton0.layer.borderColor = UIColor.blueColor().CGColor
        myButton0.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton0.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton0.tag = 0
        myButton0.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton0)
    }
    func myButtonAction1() {
        
        myButton1.backgroundColor = UIColor.blueColor()
        myButton1.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 300)
        myButton1.layer.masksToBounds = true
        myButton1.layer.cornerRadius = 10
        myButton1.layer.borderWidth = 5
        myButton1.layer.borderColor = UIColor.blueColor().CGColor
        myButton1.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton1.tag = 1
        myButton1.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
//        var tagNum: Int = 0
//        //        for var numx = 0 ; numx<400 ; numx += 100 {
//            for var numy = 200 ; numy<=600 ; numy += 100 {
//                myButton.layer.position = CGPoint(x: numx, y: numy)
//                self.view.addSubview(myButton)
//            }
//        }
        self.view.addSubview(myButton1)
    }
    func myButtonAction2() {
        myButton2.backgroundColor = UIColor.blueColor()
        myButton2.layer.position = CGPoint(x: self.view.bounds.width*3/4,y: self.view.bounds.height - 300)
        myButton2.layer.masksToBounds = true
        myButton2.layer.cornerRadius = 10
        myButton2.layer.borderWidth = 5
        myButton2.layer.borderColor = UIColor.blueColor().CGColor
        myButton2.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton2.tag = 2
        myButton2.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton2)
    }
    func myButtonAction3() {
        myButton3.backgroundColor = UIColor.blueColor()
        myButton3.layer.position = CGPoint(x: self.view.bounds.width/4,y: self.view.bounds.height - 200)
        myButton3.layer.masksToBounds = true
        myButton3.layer.cornerRadius = 10
        myButton3.layer.borderWidth = 5
        myButton3.layer.borderColor = UIColor.blueColor().CGColor
        myButton3.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton3.tag = 3
        myButton3.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton3)
    }
    func myButtonAction4() {
        myButton4.backgroundColor = UIColor.blueColor()
        myButton4.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 200)
        myButton4.layer.masksToBounds = true
        myButton4.layer.cornerRadius = 10
        myButton4.layer.borderWidth = 5
        myButton4.layer.borderColor = UIColor.blueColor().CGColor
        myButton4.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton4.tag = 4
        myButton4.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton4)
    }
    func myButtonAction5() {
        myButton5.backgroundColor = UIColor.blueColor()
        myButton5.layer.position = CGPoint(x: self.view.bounds.width*3/4,y: self.view.bounds.height - 200)
        myButton5.layer.masksToBounds = true
        myButton5.layer.cornerRadius = 10
        myButton5.layer.borderWidth = 5
        myButton5.layer.borderColor = UIColor.blueColor().CGColor
        myButton5.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton5.tag = 5
        myButton5.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton5)
    }
    func myButtonAction6() {
        myButton6.backgroundColor = UIColor.blueColor()
        myButton6.layer.position = CGPoint(x: self.view.bounds.width/4, y: self.view.bounds.height - 100)
        myButton6.layer.masksToBounds = true
        myButton6.layer.cornerRadius = 10
        myButton6.layer.borderWidth = 5
        myButton6.layer.borderColor = UIColor.blueColor().CGColor
        myButton6.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton6.tag = 6
        myButton6.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton6)
    }
    func myButtonAction7() {
        myButton7.backgroundColor = UIColor.blueColor()
        myButton7.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 100)
        myButton7.layer.masksToBounds = true
        myButton7.layer.cornerRadius = 10
        myButton7.layer.borderWidth = 5
        myButton7.layer.borderColor = UIColor.blueColor().CGColor
        myButton7.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton7.tag = 7
        myButton7.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton7)
    }
    func myButtonAction8() {
        myButton8.backgroundColor = UIColor.blueColor()
        myButton8.layer.position = CGPoint(x: self.view.bounds.width*3/4,y: self.view.bounds.height - 100)
        myButton8.layer.masksToBounds = true
        myButton8.layer.cornerRadius = 10
        myButton8.layer.borderWidth = 5
        myButton8.layer.borderColor = UIColor.blueColor().CGColor
        myButton8.setTitle("WakeUp", forState: UIControlState.Normal)
        myButton8.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton8.tag = 8
        myButton8.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton8)
    }
    
    
}

