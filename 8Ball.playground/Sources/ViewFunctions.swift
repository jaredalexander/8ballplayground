import Foundation
import UIKit

// Ratios to ensure that UI components look right no matter the width/height dimension of the parent container
let eightBallRatio: CGFloat = 0.875
let fontSizeRatio: CGFloat = 0.05

let buttonWidthRatio: CGFloat = 0.25
let buttonHeightRatio: CGFloat = 0.2

let labelWidthRatio: CGFloat = 0.3
let labelHeightRatio: CGFloat = 0.3

public func createContainer(withSize size:Int)->UIView{
    let view = UIView(frame: CGRect(x:0,y: 0,width: CGFloat(size), height: CGFloat(size)))
    view.backgroundColor = .white
    
    return view
}

public func createShakeButton(title:String, forContainer container: UIView)->UIButton{
    let containerSize = container.frame.width;
    
    let buttonWidth:CGFloat = containerSize * buttonWidthRatio
    let buttonHeight:CGFloat = containerSize * buttonHeightRatio
    
    let button = UIButton(frame: CGRect(x: (containerSize - buttonWidth)/2, y: containerSize + 10 - buttonHeight,width: buttonWidth, height: buttonHeight))
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    return button
}

public func createEightBallImage(fileName imageFileName:String, forContainer container: UIView)->UIImageView{
    let containerSize = container.frame.width;
    
    let eightBallWidth:CGFloat = containerSize * eightBallRatio
    let eightBallHeight:CGFloat = containerSize * eightBallRatio

    let eightBall = UIImageView(frame: CGRect(x: (containerSize-eightBallWidth)/2, y: (containerSize-eightBallHeight)/2, width: eightBallWidth, height: eightBallHeight))
    eightBall.image = UIImage(named: imageFileName)
    return eightBall
}

public func createPhraseLabel(forContainer container: UIView)->UILabel{
    let containerSize = container.frame.width;
    let eightBallWidth = containerSize * eightBallRatio
    
    
    let labelWidth:CGFloat = eightBallWidth * labelWidthRatio
    let labelHeight:CGFloat = eightBallWidth * labelHeightRatio
    
    let label = UILabel(frame: CGRect(x: (eightBallWidth - labelWidth)/2,y: (eightBallWidth - labelHeight)/2, width: labelWidth, height: labelHeight))
    label.textAlignment = .center
    label.textColor = .white
    label.numberOfLines = 0
    label.isHidden = true
    label.font = UIFont(name: label.font!.fontName, size: fontSizeRatio * eightBallWidth)
    
    return label
}
