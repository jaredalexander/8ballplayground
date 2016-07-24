import UIKit
import XCPlayground

//what's a magic 8 ball??
//https://www.youtube.com/watch?v=mFOracFClBg

//define our 8 ball phrases
let phrases = ["It is certain",
               "It is decidedly so",
               "Without a doubt",
               "Yes, definitely",
               "You may rely on it",
               "As I see it, yes",
               "Most likely",
               "Outlook good",
               "Yes",
               "Signs point to yes",
               "Reply hazy try again",
               "Ask again later",
               "Better not tell you now",
               "Cannot predict now",
               "Concentrate and ask again",
               "Don't count on it",
               "My reply is no",
               "My sources say no",
               "Outlook not so good",
               "Very doubtful"]

//random phrase picker
func pickRandomPhrase()->String{
    let randomIndex = randomNumberBetween(start:0, end: phrases.count)
    return phrases[randomIndex]
}

//create a parent view container that holds the other views
let container = createContainer(withSize: 400)

//create our child UI components
let eightBall = createEightBallImage(fileName: "ball.png", forContainer: container)
let phraseLabel = createPhraseLabel(forContainer: container)
let shakeButton = createShakeButton(title: "Shake!", forContainer: container)

//add the phrase label to the eight ball image
eightBall.addSubview(phraseLabel)

//add our eight ball and button to the container
container.addSubview(eightBall)
container.addSubview(shakeButton)

//interactivity:

//define a responder that reacts to a button press
class Responder : NSObject {
    func buttonPressed() {
        //shake the eight ball
        shakeView(eightBall)
        
        //after a brief delay, set the text on the label and speak it!
        wait(1.0){
            //configure phrase
            let phrase = pickRandomPhrase()
            phraseLabel.text = phrase
            phraseLabel.hidden = false
            
            //speak phrase
            speak(phrase)
        }
    }
}

//instantiate a responder
let responder = Responder()

//add a button target to shake the 8 ball and pick a phrase when pressed
shakeButton.addTarget(responder, action: #selector(Responder.buttonPressed), forControlEvents: .TouchUpInside)

//make the container interactive and previewable
XCPlaygroundPage.currentPage.liveView = container
