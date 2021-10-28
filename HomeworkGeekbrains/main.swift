//
//  main.swift
//  HomeworkGeekbrains
//
//  Created by Александр on 18.10.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

// Набор перечислений

enum DoorStatus {
    case open
    case close
}

enum EngineStatus {
    case engineOn
    case engineOff
}

enum Tuning {
    case stageOne
    case stageTwo
    case stageThree
    case stock
}

enum Trailer: Double {
    case bigTrailer = 150000
    case midTrailer = 100000
    case smallTrailer = 50000
    case noTrailer = 0
}


// Набор классов

class Car {
    
    let color: String
    let brand: String
    let model: String
    let powerOfEngine: Double
    var doorStatus: DoorStatus
    var engineStatus: EngineStatus
    
    init(color: String, brand: String, model: String, powerOfEngine: Double, doorStatus: DoorStatus, engineStatus: EngineStatus) {
        self.brand = brand
        self.color = color
        self.model = model
        self.doorStatus = doorStatus
        self.engineStatus = engineStatus
        self.powerOfEngine = powerOfEngine
    }
    
    
    func interactionDoor() {
        switch doorStatus {
        case .close:
            doorStatus = .open
            print("Door's of \(brand)\(model) are open")
        case .open:
            doorStatus = .close
            print("Door's of \(brand)\(model) are close")
        }
    }
    
    
    func interactionEngine() {
        switch engineStatus {
        case .engineOff:
            engineStatus = .engineOn
            print("Engine of \(brand)\(model) is on")
        case .engineOn:
            engineStatus = .engineOff
            print("Engine of \(brand)\(model) is off")
        }
    }
    
    func info () {
        print(print("Infomation about \(brand)\(model): colour is \(color), power of engine - \(powerOfEngine), engine status - \(engineStatus), door's are \(doorStatus)."))
    }
}


class SportCar: Car {
    
    var acceleration: Double
    var maxSpeed: Double
    var tuning: Tuning
    var stockSpeed: Double
    var stockAcceleration: Double
    
    
    init(color: String, brand: String, model: String, powerOfEngine: Double, doorStatus: DoorStatus, engineStatus: EngineStatus, acceleration: Double, maxSpeed: Double, tuning: Tuning, stockSpeed: Double, stockAcceleration: Double) {
        
        self.acceleration = stockAcceleration
        self.maxSpeed = stockSpeed
        self.tuning = tuning
        self.stockSpeed = stockSpeed
        self.stockAcceleration = stockAcceleration
        
        super.init(color: color, brand: brand, model: model, powerOfEngine: powerOfEngine, doorStatus: doorStatus, engineStatus: engineStatus)
    }
    
    
    func tuneThisCar(stage: Tuning){
        switch stage {
        case .stageOne:
            maxSpeed = stockSpeed * 1.25
            acceleration = stockAcceleration / 1.5
            
            print("Stage one done! Speed was \(stockSpeed), now - \(maxSpeed)")
            print("Acceleration was \(stockAcceleration), now acceleration - \(acceleration)")
            
        case .stageTwo:
            maxSpeed = stockSpeed * 1.75
            acceleration = stockAcceleration / 2
            
            print("Stage two done! Speed was \(stockSpeed), now - \(maxSpeed)")
            print("Acceleration was \(stockAcceleration), now acceleration - \(acceleration)")
            
        case .stageThree:
            maxSpeed = stockSpeed * 2
            acceleration = stockAcceleration / 3
            
            print("Stage three done! Speed was \(stockSpeed), now - \(maxSpeed)")
            print("Acceleration was \(stockAcceleration), now acceleration - \(acceleration)")
            
        case .stock:
            maxSpeed = stockSpeed
            acceleration = stockAcceleration
            
            print("Well, welcome to stock! Your max speed is stock - \(stockSpeed)")
            print("Your acceleration is stock - \(stockAcceleration)")
        
        }
    }
    
    override func info() {
        super.info()
        print("Special character: maximum of speed - \(maxSpeed), acceleration for 100 km per hour - \(acceleration) sec, stage of tuning - \(tuning)")
    }
}


class TrunckCar: Car {
    
    
    var workloadTrailer: Double
    let startVolume: Double = 0
    var numberOfWheels: Int
    var trailer: Trailer
    
    init(color: String, brand: String, model: String, powerOfEngine: Double, doorStatus: DoorStatus, engineStatus: EngineStatus, numberOfWheels: Int, trailer: Trailer, workloadTrailer: Double) {
        
        self.numberOfWheels = numberOfWheels
        self.trailer = trailer
        self.workloadTrailer = startVolume
        
        
        super.init(color: color, brand: brand, model: model, powerOfEngine: powerOfEngine, doorStatus: doorStatus, engineStatus: engineStatus)
    }
    
    func loadTrailer(cargo: Double) {
        switch trailer {
        case .noTrailer:
            print("You have no trailer, bro")
            break
        default:
            cargo <= (trailer.rawValue - workloadTrailer) ? workloadTrailer = workloadTrailer + cargo : print ("Too much for trailer!")
            print("Workload of trailer is \(workloadTrailer) now, free volume - \(trailer.rawValue - workloadTrailer)")
        }
    }
    
    func makeEmptyTrailer() {
        workloadTrailer = 0
        print("Well, we will make your trailer empty. Free volume - \(trailer.rawValue)")
    }
    
    func changeTrailer (newTrailer: Trailer) {
        trailer = newTrailer
        switch trailer {
        case .noTrailer:
            numberOfWheels = 6
        default:
            numberOfWheels += 8
        }
        print("Trailer was switched on \(trailer)")
    }
    override func info() {
        super.info()
        print("Special character: truck have \(trailer) on \(trailer.rawValue), number of wheels \(numberOfWheels), free volume of trailer - \(trailer.rawValue - workloadTrailer) ")
    }
    
}

// Объявления новых экземпляров и действия с ними

var sportcarOne = SportCar(color: "Red", brand: "Toyota", model: "MARK II", powerOfEngine: 300, doorStatus: .close, engineStatus: .engineOff, acceleration: 8.5, maxSpeed: 250, tuning: .stock, stockSpeed: 250, stockAcceleration: 8.5)

sportcarOne.info()

sportcarOne.interactionEngine()
sportcarOne.interactionDoor()
sportcarOne.interactionDoor()

sportcarOne.tuneThisCar(stage: .stageOne)
sportcarOne.tuneThisCar(stage: .stageTwo)
sportcarOne.tuneThisCar(stage: .stageThree)
sportcarOne.tuneThisCar(stage: .stock)

sportcarOne.info()

var truckOne = TrunckCar (color: "white", brand: "MAN", model: "FN16", powerOfEngine: 900, doorStatus: .close, engineStatus: .engineOff, numberOfWheels: 6, trailer: .noTrailer, workloadTrailer: 0)

truckOne.info()


truckOne.changeTrailer(newTrailer: .noTrailer)
truckOne.changeTrailer(newTrailer: .bigTrailer)

truckOne.loadTrailer(cargo: 40000)
truckOne.loadTrailer(cargo: 50000)
truckOne.loadTrailer(cargo: 1000)
truckOne.loadTrailer(cargo: 400000000)

truckOne.interactionEngine()
truckOne.interactionEngine()

truckOne.info()
