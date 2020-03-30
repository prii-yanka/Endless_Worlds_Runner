//
//  Object.swift
//  JoyStickControls
//
//  Created by Justin Dike on 5/4/15.
//  Copyright (c) 2015 CartoonSmart. All rights reserved.
//

import Foundation
import SpriteKit

class Object: SKNode {
    
    var objectSprite:SKSpriteNode = SKSpriteNode()
    var imageName:String = ""
   
    var theType:LevelType = LevelType.ground
    
    var levelUnitWidth:CGFloat = 0
    var levelUnitHeight:CGFloat = 0
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init () {
        
        super.init()
        
        
    }
    
    func createObject() {
        
        
        if (theType == LevelType.water) {
            
            
            imageName = "Platform"
            
        } else {
            
            let diceRoll = arc4random_uniform(7)
            
            if ( diceRoll == 0) {
                
                imageName = "Platform"
                
            } else if ( diceRoll == 1) {
                
                imageName = "Wheel"
                
            } else if ( diceRoll == 2) {
                
                imageName = "Barrel"
                
            } else if ( diceRoll == 3) {
                
                imageName = "Cactus"
                
            } else if ( diceRoll == 4) {
                
                imageName = "Rock"
                
            } else if ( diceRoll == 5) {
                
                imageName = "Money"
                
            } else if ( diceRoll == 6) {
                
                // increase liklihood of another platform
                imageName = "Platform"
                
            }

            
            
        }
        
        


        objectSprite = SKSpriteNode(imageNamed:imageName)
        
        self.addChild(objectSprite)
        
        if ( imageName == "Platform") {
            
            let newSize:CGSize = CGSize(width: objectSprite.size.width, height: 10)
            
            objectSprite.physicsBody = SKPhysicsBody(rectangleOf: newSize, center:CGPoint(x: 0, y: 50))
            objectSprite.physicsBody!.categoryBitMask = BodyType.platformObject.rawValue
           
            objectSprite.physicsBody!.friction = 1
            objectSprite.physicsBody!.isDynamic = false
            objectSprite.physicsBody!.affectedByGravity = false
            objectSprite.physicsBody!.restitution = 0.0
            objectSprite.physicsBody!.allowsRotation = false
            
            if ( theType == LevelType.water) {
                
                self.position = CGPoint(x: 0, y: -110)
                
            } else {
                
                let diceRoll = arc4random_uniform(2)
                
                if ( diceRoll == 0) {
                    
                    self.position = CGPoint(x: 0, y: -110)
                    
                } else if ( diceRoll == 1) {
                    
                    self.position = CGPoint(x: 0, y: -50)
                    
                }
                
            }
            
            
            let width:UInt32 = UInt32(levelUnitWidth)
            
            let diceRollX = arc4random_uniform(width)
            
            self.position = CGPoint( x: CGFloat(diceRollX) - (levelUnitWidth / 2),  y: self.position.y)
            
            
        } else if ( imageName == "Wheel") {
            
            objectSprite.physicsBody = SKPhysicsBody(circleOfRadius: objectSprite.size.width / 2)
            objectSprite.physicsBody!.categoryBitMask = BodyType.wheelObject.rawValue
            objectSprite.physicsBody!.contactTestBitMask = BodyType.wheelObject.rawValue | BodyType.deathObject.rawValue | BodyType.water.rawValue
            objectSprite.physicsBody!.friction = 1
            objectSprite.physicsBody!.isDynamic = true
            objectSprite.physicsBody!.affectedByGravity = true
            objectSprite.physicsBody!.restitution = 0.5
            objectSprite.physicsBody!.allowsRotation = true
            
            let width:UInt32 = UInt32(levelUnitWidth / 3)
            
            let diceRollX = arc4random_uniform(width)
            
            self.position = CGPoint( x: CGFloat(diceRollX) + (levelUnitWidth / 3),  y: 400)
            
            
            
        } else if ( imageName == "Money") {
            
            objectSprite.physicsBody = SKPhysicsBody(circleOfRadius: objectSprite.size.width / 2)
            objectSprite.physicsBody!.categoryBitMask = BodyType.moneyObject.rawValue
            
            objectSprite.physicsBody!.friction = 1
            objectSprite.physicsBody!.isDynamic = true
            objectSprite.physicsBody!.affectedByGravity = true
            objectSprite.physicsBody!.restitution = 0.0
            objectSprite.physicsBody!.allowsRotation = true
            
            let width:UInt32 = UInt32(levelUnitWidth / 3)
            
            let diceRollX = arc4random_uniform(width)
            
            self.position = CGPoint( x: CGFloat(diceRollX) + (levelUnitWidth / 3),  y: 400)
            
            
            
            
        } else {
            
            
            objectSprite.physicsBody = SKPhysicsBody(circleOfRadius: objectSprite.size.width / 1.8)
            objectSprite.physicsBody!.categoryBitMask = BodyType.deathObject.rawValue
            objectSprite.physicsBody!.contactTestBitMask = BodyType.deathObject.rawValue | BodyType.ground.rawValue | BodyType.wheelObject.rawValue | BodyType.water.rawValue
            
            objectSprite.physicsBody!.friction = 1
            objectSprite.physicsBody!.isDynamic = true
            objectSprite.physicsBody!.affectedByGravity = true
            objectSprite.physicsBody!.restitution = 0.0
            objectSprite.physicsBody!.allowsRotation = false
            
            
            let width:UInt32 = UInt32(levelUnitWidth)
            
            let diceRollX = arc4random_uniform(width)
            
            self.position = CGPoint( x: CGFloat(diceRollX) - (levelUnitWidth / 2),  y: 500)
            
            
        }

        
    
        self.zPosition = 102
        self.name = "obstacle"

        
    }
    
    
   
    
    
    
}





