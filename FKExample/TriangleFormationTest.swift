//
//  TriangleFormationTest.swift
//  FKExample
//
//  Created by Ryan Campbell on 3/24/16.
//  Copyright © 2016 Phalanx Studios. All rights reserved.
//

import SpriteKit
import GameplayKit
import FormationKit
import SwitchBoard
import Particleboard

class TriangleFormationTest : Testable {
    
    weak var scene : GameScene?
    
    init(scene:GameScene) {
        self.scene = scene
    }
    
    func setupTest() {
        self.scene?.createSquadWithHero(.Triangle)
    }
    
    func tapped(location: CGPoint) {
        let end = self.scene?.convertPoint(location, fromNode: (self.scene?.childNodeWithName("World")!)!)
        if let pathfinding = self.scene?.getPathToPoint((self.scene?.squads[0].agent.actualPosition)!, end: end!) {
            let instructions = FKMovementInstructions(position: location, path: pathfinding.path, type: FKMovementType.Path)
            self.scene?.squads[0].navigationComponent.executeMovementInstructions(instructions)
        }
    }
    
    func teardownTest() {
        
    }
    
}
