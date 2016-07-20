import Foundation
import UIKit

// Ratio of eight ball to container frame
let eightBallRatio: CGFloat = 0.875
let fontSizeRatio: CGFloat = 0.05

let buttonWidthRatio: CGFloat = 0.25
let buttonHeightRatio: CGFloat = 0.2

let labelWidthRatio: CGFloat = 0.3
let labelHeightRatio: CGFloat = 0.3

public func createContainer(size:Int)->UIView{
    let view = UIView(frame: CGRectMake(0,0,CGFloat(size),CGFloat(size)))
    view.backgroundColor = .whiteColor()
    
    return view
}

public func createShakeButton(title:String, forContainer container: UIView)->UIButton{
    let containerSize = container.frame.width;
    
    let buttonWidth:CGFloat = containerSize * buttonWidthRatio
    let buttonHeight:CGFloat = containerSize * buttonHeightRatio
    
    let button = UIButton(frame: CGRectMake((containerSize - buttonWidth)/2, containerSize + 10 - buttonHeight,buttonWidth,buttonHeight))
    button.setTitle(title, forState: .Normal)
    button.setTitleColor(.blackColor(), forState: .Normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    return button
}

public func createEightBallImage(imageFileName:String, forContainer container: UIView)->UIImageView{
    let containerSize = container.frame.width;
    
    let eightBallWidth:CGFloat = containerSize * eightBallRatio
    let eightBallHeight:CGFloat = containerSize * eightBallRatio

    let eightBall = UIImageView(frame: CGRectMake((containerSize-eightBallWidth)/2,(containerSize-eightBallHeight)/2,eightBallWidth,eightBallHeight))
    eightBall.image = UIImage(named: imageFileName)
    return eightBall
}

public func createPhraseLabel(forContainer container: UIView)->UILabel{
    let containerSize = container.frame.width;
    let eightBallWidth = containerSize * eightBallRatio
    
    
    let labelWidth:CGFloat = eightBallWidth * labelWidthRatio
    let labelHeight:CGFloat = eightBallWidth * labelHeightRatio
    
    let label = UILabel(frame: CGRectMake((eightBallWidth - labelWidth)/2,(eightBallWidth - labelHeight)/2,labelWidth,labelHeight))
    label.text = "Things look good!"
    label.textAlignment = .Center
    label.textColor = .whiteColor()
    label.numberOfLines = 0
    label.hidden = true
    label.font = UIFont(name: label.font!.fontName, size: fontSizeRatio * eightBallWidth)
    
    return label
}