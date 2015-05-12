//: Playground - noun: a place where people can play

import UIKit

enum ShapeType : Int {
    case Triangle = 3
    case Rectangle = 4
    case Pentagon = 5
    case Hexagon = 6
    case Septagon = 7
    case Octogon = 8
    
}

class Shape {
    //not set yet but will be
    var sides: Int!
    //needs to be unwrapped
    var fillColor: UIColor?
    var strokeColor: UIColor?
    
    init(type: ShapeType) {
        
        sides = type.rawValue
    }
    
        
        
}


    var square1 = Shape(type: .Rectangle)


    var squarepixels = 4 * square1.sides

    square1.fillColor = UIColor.blueColor()


    var sidecount = square1.sides

    var triangle1 = Shape(type: .Triangle)


//Example
class Mouth {
    var lipsColor: UIColor!
    var teethCount: Int!
    
    var badBreath: Bool = false
    var fullOfFood: Bool = false
    
    init(teeth: Int, lips: UIColor) {
        
    }
  
    func chewFood(food: AnyObject) {
       
    }
    
    func yawn() {





// Create a playground

1. Make a Class BodyPart
2. Make 20 Classes that are BodyParts
        3. Each class will have 3 properties (EyeColor: UIColor, teeth, Int, etc)
4. Each class will have 3 methods (chew (), sprain (), etc
5. At least  15 methods need to be called from another BodyPart.
Total of 60 methods
15/60 must be called from another body part. (one body part needs to tell another body part what to do) Hand is telling finger to bend

At least 10 properties need to be other BodyParts (face has property of mouth)


    class Face(
        )




        
        
}



































