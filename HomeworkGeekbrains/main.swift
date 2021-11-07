//
//  main.swift
//  HomeworkGeekbrains
//
//  Created by Александр on 18.10.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

enum EngineState {
    case start
    case stop
}

enum CarError: Error {
    case noFuel
    case engineBroke
}

class Car {
    var fuel: Int
    var engineWork: Bool
    private var engineState: EngineState
    
    init(fuel: Int, engineWork: Bool, engineState: EngineState) {
        self.engineWork = engineWork
        self.fuel = fuel
        self.engineState = .stop
    }
    
    func doEngine ()  throws {
        
        switch engineState {
        case .stop:
            guard fuel > 0 else {throw CarError.noFuel}
            guard engineWork else {throw CarError.engineBroke}
            
            engineState = .start
            print("Engine is on")
        case .start:
            engineState = .stop
            print("Engine is stopped")
        }
    }
}

var carOne = Car(fuel: 13, engineWork: true, engineState: .stop)

carOne.engineWork = false

do {
    try carOne.doEngine()
} catch CarError.noFuel {
    print("No gas, bro")
} catch CarError.engineBroke{
    print("U can't move, bro, repare your engine!!!! ")
}

carOne.fuel = 0

do {
    try carOne.doEngine()
} catch CarError.noFuel {
    print("No gas, bro")
} catch CarError.engineBroke{
    print("U can't move, bro, repare your engine!!!! ")
}

carOne.engineWork = true
carOne.fuel = 9999

do {
    try carOne.doEngine()
} catch CarError.noFuel {
    print("No gas, bro")
} catch CarError.engineBroke{
    print("U can't move, bro, repare your engine!!!! ")
}
