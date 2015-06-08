//
//  GameScene.m
//  PixelAdventure
//
//  Created by Whitney Lauren on 6/8/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
{
    SKShapeNode * pixel;
    
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
      self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:view.frame];
  
  //  SKFieldNode * field = [SKFieldNode radialGravityField];
    
  //  field.position = view.center;
   // field.strength = 100;
    
    
  //  [self addChild:field];
    
 //   self.backgroundColor = [UIColor blackColor];
    
    pixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(10, 10)];
    
    pixel.fillColor = [UIColor cyanColor];
    pixel.strokeColor = [UIColor clearColor];
    
    
    pixel.position = CGPointMake(10,10);
    
   // pixel.physicsBody.friction = 10;
    pixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    
    [self addChild:pixel];
    
}

-(void)movePixelInDirection:(CGVector)direction {
    
   // [pixel.physicsBody applyImpulse:direction];
    //[pixel.physicsBody applyForce:direction];
    
    CGFloat newX = pixel.position.x + direction.dx;
    CGFloat newY = pixel.position.y + direction.dy;
    
    pixel.position = CGPointMake(newX, newY);
    
    
}

-(void)normalAttack{
    
    SKShapeNode * babyPixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(2, 2)];
    
    babyPixel.fillColor = [UIColor magentaColor];
    babyPixel.strokeColor = [UIColor clearColor];
    
    babyPixel.position = CGPointMake(pixel.position.x + 10, pixel.position.y);
    
    [self addChild:babyPixel];
    
    babyPixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    
    babyPixel.physicsBody.affectedByGravity = NO;
     
    [babyPixel.physicsBody applyImpulse:CGVectorMake(0.1, 0)];
     
    
}

-(void)specialAttack{
    
    SKEmitterNode * fireBall = [SKEmitterNode nodeWithFileNamed:@"Attack"];
    
    
    fireBall.position = CGPointMake(pixel.position.x + 10, pixel.position.y);
    
    [self addChild:fireBall];
    
    fireBall.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    
    //fireBall.physicsBody.affectedByGravity = NO;
    
    [fireBall.physicsBody applyImpulse:CGVectorMake(0.1, 0.1)];
    

    
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
