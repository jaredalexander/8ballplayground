import Foundation
import AVFoundation
import UIKit

let synthesizer = AVSpeechSynthesizer()

public func wait(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

public func speak(text:String){
    let utterance = AVSpeechUtterance(string: text)
    utterance.pitchMultiplier = 1.0
    utterance.rate = 0.5
    synthesizer.speakUtterance(utterance)
}

public func randomNumberBetween(start start:Int,end:Int)->Int{
    let num = Int(arc4random_uniform(UInt32(end)))
    return num
}

public func shakeView(view:UIView) {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    animation.duration = 1.0
    animation.values = [-30.0, 30.0, -30.0, 30.0,-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    view.layer.addAnimation(animation, forKey: "shake")
}