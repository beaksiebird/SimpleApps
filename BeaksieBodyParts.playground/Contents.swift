//: Playground - noun: a place where people can play

import UIKit
//Jo's Examples
class BodyPart {
    var isDamaged = false
}

class Hand : BodyPart {
    
    var fingers: [[Finger] ]
    
    override init () {
        
        fingers.append(Finger() }
    
        func closeHand() {
            
            for finger in fingers {
            
            finger.fingerCurl ()
            
            }
            }
    
class Finger : BodyPart {
    var boneCount: Int!
    
    func fingerCurl() {
        println("Curling\(self)")
        
        
    }
    
}

class Thumb : Finger {
    var isDoubleJoined = false
    
}

class Arm : BodyPart {
    
    var hand: Hand!
    
    override init() {
        
        hand = Hand()
        
    }
    
        var leftArm = Arm()

        
    
    



    

































//My HW
class BodyPart {
    
    var parts: Int!
    var colors: UIColor?
}

class Mouth {
    var lipsColor: UIColor!
    var teethCount: Int!
    var prettyLips: Bool = false
    
    init(lipsColor: UIColor, teethCount: Int) {
        
    }

func openMouth () {
    
}
func closeMouth() {
    
}
func lickLips () {
    
}

class Eyes {
    var eyeColor: UIColor!
    var eyeSize: Int!
    var eyelashLength: Int!
    
    init(eyeColor: UIColor, eyeSize: Int, eyelashLength: Int)}

func openEyes () {
    
}
func closeEyes () {
    
}
func avertEyes () {
    
}

class Teeth {
    var teethSize: Int!
    var teethColor: UIColor!
    var braces: Bool = false
   
    init(teethSize: Int, teethColor: UIColor, braces = false)}

func tapTeeth () {
    
}
func clickTeethTogether () {
    
}
func lickTeeth () {
    
}

class Hair {
    var hairColor: UIColor!
    var hairLength: Int!
    var softHair: Bool = false
    
    init(hairColor: UIColor, hairLength: Int, softHair = false)}

func brushHair (){

}
func cutHair (){
    
}
func preenHair (){
    
}

class Hands {
    var handSize: Int!
    var handSoft: Bool = false
    var handColor: UIColor

    init(handSize: Int, handSoft= false, handColor: UIColor)}

func tapHand () {
    
}
func shakeHand () {
    
}
func waveHand () {
    
}

class Fingers {
    var fingerLength: Int!
    var fingerSoft: Bool = false
    var fingerColor: UIColor
    
    init(fingerLength: Int, fingerSoft= false, fingerColor: UIColor)}

func extendFinger () {
    
}
func tapFinger () {
    
}
func bendFinger () {
    
}

class FingerNails {
    var nailLength: Int!
    var nailColor: UIColor!
    var nailPretty: Bool = false
    
    init (nailLength: Int, nailColor: UIColor, nailPretty = false)}

func tapNail () {
    
}
func paintNail () {
    
}
func biteNail () {
    
}

class Arm {
    var armLength: Int!
    var armWidth: Int!
    var armStrong: Bool = false

    init (armLength: Int, armWidth : Int, armStrong = false)}

func extendArm () {
    
}
func swingArm () {
    
}
func liftArm () {
    
}

class Legs {
    var legLength: Int!
    var legColor: UIColor!
    var legStrong: Bool = false
    
    init (legLegnth: Int, legColor: UIColor, legStrong = false)}

func extendLeg () {
    
}
func leftLeg () {
    
}
func kickLeg () {
    
}

class Feet {
    var feetLength: Int!
    var feetSize: Int!
    var feetSmell: Bool = false
    
    init (feetLength: Int, feetSize: Int, feetSmell = false)}

func stretchfeetfromleg () {
    
}
func rotatefeetfromankles () {
    
}
func kickfeet () {
    
}

class Toenails {
    var toenailLength: Int!
    var toenailColor: UIColor!
    var toenailGross: Bool = false

    init (toenailLength: Int, toenailColor: UIColor, toenailGross = false)}

func cuttoenailfromfoot () {
    
}
func painttoenail () {
    
}
func taptoenail () {
    
}

class Elbow {
    var elbowSize: Int!
    var elbowColor: UIColor!
    var elbowSmooth: Bool = false
    
    init (elbowSize: Int, elbowColor: UIColor, elbowSmooth = false)}

func bendelbowfromarm () {
    
}
func hitelbow () {
    
}
func extendeblowfromarm () {
    
}

class Ears {
    var earSize: Int!
    var earLength: Int!
    var earPeirced: Bool = false
   
    init (earSize: Int, earLength: Int, earPeirced = false)}

func scratchEar () {
    
}
func peirceEar () {
    
}
func kissEar () {
    
}

class Stomach {
    var stomachColor: UIColor!
    var stomachWidth: Int!
    var stomachRipped: Bool = false
    
    init(stomachColor: UIColor, stomachWidth: Int, stomachRipped = false)}

func workoutStomach () {
    
}
func stretchStomach () {
    
}
func rubStomach () {
    
}

class Bottem {
    var bottemSize: Int!
    var bottemFit: Bool = false
    var bottemNice: Bool = false
    
    init(bottemSize: Int, bottemFit = false, bottemNice = false)}

func shakeBottem () {
    
}
func slapBottem () {
    
}
func sitonBottem () {
    
}

class Face {
    var facePretty: Bool = false
    var faceSize: Int!
    var faceColor: UIColor!
    
    init (facePretty = false, faceSize: Int, faceColor: UIColor)}

func faceSmile () {
    
}
func faceFrown () {
    
}
func faceLaugh () {
    
}

class Cheek {
    var cheekSize: Int!
    var cheekColor: UIColor!
    var cheekSoft: Bool = false
    
    init (cheekSize: Int, cheekColor: UIColor, cheekSoft)}


func cheekblush () {
    
}
func pinchcheek () {
    
}
func scratchcheek () {
    
}

class Eyebrows {
    var eyebrowsSize: Int!
    var eyebrowsColor: UIColor!
    var eyebrowsPretty: Bool = false
    
    init (eyebrowsSize: Int, eyebrowsColor: UIColor, eyebrowsPretty = false)}

func raiseEyebrows() {
    
}
func waxEyebrows () {
    
}
func ColorEyebrows () {
    
}

class Shoulders {
    var shouldersSize: Int!
    var shouldersColor: UIColor!
    var shouldersStrong: Bool = false
    
    init (shouldersSize: Int, shouldersColor: UIColor, shouldersStrong = false)}

func workoutShoulders () {
    
}
func shrugShoulders () {
    
}
func relaxShoulders () {
    
}

class Ankle {
    var ankleSize: Int!
    var ankleColor: UIColor!
    var ankleBroken: Bool = false
    
    init (ankleSize:Int, ankleColor: UIColor, ankleBroken = false)}

func breakAnkle () {
    
}
func rotateAnkle () {
    
}
func sprainAnkle () {

}












