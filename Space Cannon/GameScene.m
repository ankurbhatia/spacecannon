//
//  GameScene.m
//  Space Cannon
//
//  Created by Ankur Bhatia on 9/29/14.
//  Copyright (c) 2014 Ankur Bhatia. All rights reserved.
//

#import "GameScene.h"


@interface GameScene ()

@property BOOL contentCreated;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents {
    SKNode *edge = [SKNode node];
    edge.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self addChild:edge];
    printf("screen dimensions: width = %f; height = %f\n", self.frame.size.width, self.frame.size.height);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerBall"];
        sprite.position = location;
        sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25.0];
        sprite.physicsBody.linearDamping = 0.0;
        sprite.physicsBody.friction = 0.0;
        sprite.physicsBody.restitution = 1.0;
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
