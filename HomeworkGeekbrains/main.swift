//
//  main.swift
//  HomeworkGeekbrains
//
//  Created by Александр on 18.10.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

//MARK: - Enum's

enum WindowActions {
    case open
    case close
}

enum EngineActions {
    case start
    case stop
}

enum AlarmActions {
    case on
    case off
}

enum TransmissionType {
    case front
    case back
    case full
}
enum Tuning {
    case stageOne
    case stageTwo
    case stageThree
    case stock
}
enum TankActions{
    case empty
    case full
}

// MARK: - Protocol & Extension

protocol CarProtocol {

    var brand: String {get set}
    var model: String {get set}
    var color: String {get set}
    var tranmissionType: TransmissionType {get set}
    var windowState: WindowActions {get set}
    var engineState: EngineActions {get set}

}

extension CarProtocol {

    mutating func actionWindow () {
        switch windowState {
        case .open:
            windowState = .close
            print("Окна \(brand) \(model)  закрыты")
        default:
            windowState = .open
            print("Окна \(brand) \(model)  открыты")
        }
    }

    mutating func actionEngine () {
        switch engineState {
        case .start:
            engineState = .stop
            print("Двигатель \(brand) \(model) заглушен")
        default:
            engineState = .start
            print("Двигатель \(brand) \(model) запущен")
        }
    }
}

//MARK: - Classes & Extencions

class SportCar: CarProtocol {

    var brand: String
    var model: String
    var color: String
    var tranmissionType: TransmissionType
    var windowState: WindowActions
    var engineState: EngineActions

    //Special Characters
    var acceleration: Double
    var maxSpeed: Double
    var tuning: Tuning
    var stockSpeed: Double
    var stockAcceleration: Double

    init(
    brand: String,
    model: String,
    color: String,
    tranmissionType: TransmissionType,
    windowState: WindowActions,
    engineState: EngineActions,
    acceleration: Double,
    maxSpeed: Double,
    tuning: Tuning,
    stockSpeed: Double,
    stockAcceleration: Double)
    {
        self.brand = brand
        self.model = model
        self.color = color
        self.tranmissionType = tranmissionType
        self.windowState = windowState
        self.engineState = engineState
        self.acceleration = acceleration
        self.maxSpeed = maxSpeed
        self.tuning = tuning
        self.stockSpeed = stockSpeed
        self.stockAcceleration = stockAcceleration
    }

    func tuneThisCar(stage: Tuning) {
    switch stage {
    case .stageOne:
        maxSpeed = stockSpeed * 1.25
        acceleration = stockAcceleration / 1.5
        tuning = .stageOne

        print("Стадия один реализована! Максимальная скорость была - \(stockSpeed), сейчас - \(maxSpeed)")
        print("Разгон до 100кмч был - \(stockAcceleration), сейчас - \(acceleration)")

    case .stageTwo:
        maxSpeed = stockSpeed * 1.75
        acceleration = stockAcceleration / 2
        tuning = .stageTwo

        print("Стадия два реализована! Максимальная скорость была - \(stockSpeed), сейчас - \(maxSpeed)")
        print("Разгон до 100кмч был - \(stockAcceleration), сейчас - \(acceleration)")

    case .stageThree:
        maxSpeed = stockSpeed * 2
        acceleration = stockAcceleration / 3
        tuning = .stageThree

        print("Стадия три реализована! Максимальная скорость была - \(stockSpeed), сейчас - \(maxSpeed)")
        print("Разгон до 100кмч был - \(stockAcceleration), сейчас - \(acceleration)")
    case .stock:
        maxSpeed = stockSpeed
        acceleration = stockAcceleration
        tuning = .stock

        print("Итак, добро пожаловать к истокам! Максимальная скорость сейчас - \(stockSpeed)")
        print("Разгон стал стоковым - \(stockAcceleration)")

        }
    }

}

class TrunckCar: CarProtocol {
    var brand: String
    var model: String
    var color: String
    var tranmissionType: TransmissionType
    var windowState: WindowActions
    var engineState: EngineActions
    // Special Characters
    var tankState: TankActions

    init(
    brand: String,
    model: String,
    color: String,
    tranmissionType: TransmissionType,
    windowState: WindowActions,
    engineState: EngineActions,
    tankState: TankActions)
    {
        self.brand = brand
        self.model = model
        self.color = color
        self.tranmissionType = tranmissionType
        self.windowState = windowState
        self.engineState = engineState
        self.tankState = tankState
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Информация - \(brand)\(model): \n цвет - \(color) \n состояние двигателя - \(engineState) \n состояние окон - \(windowState) \n максимальная скорость - \(maxSpeed)\n разгон до 100 кмч - \(acceleration) сек \n стадия тюнинга - \(tuning)"
    }
}

extension TrunckCar: CustomStringConvertible {
    var description: String {
        return " Информация - \(brand)\(model):\n цвет - \(color) \n состояние двигателя - \(engineState) \n состояние окон - \(windowState) \n состояние цистерны - \(tankState)"
    }
}

//MARK: - Экземпляры

var octaviaSport = SportCar(brand: "Skoda", model: "Octavia", color: "Black", tranmissionType: .front, windowState: .close, engineState: .stop, acceleration: 15.1, maxSpeed: 210, tuning: .stock, stockSpeed: 210, stockAcceleration: 15.1)

var kamazTrunck = TrunckCar(brand: "KAMaz", model: "Classic", color: "Red", tranmissionType: .full, windowState: .close, engineState: .stop, tankState: .empty)

//MARK: - Действия над экземплярами
print(octaviaSport.description)
octaviaSport.tuneThisCar(stage: .stageOne)
octaviaSport.tuneThisCar(stage: .stageTwo)
octaviaSport.tuneThisCar(stage: .stageThree)

octaviaSport.actionEngine()
octaviaSport.actionWindow()
octaviaSport.actionWindow()

print(octaviaSport.description)
print("\n")

// Действия с КАМАЗом
print(kamazTrunck.description)

kamazTrunck.actionEngine()
kamazTrunck.actionWindow()
kamazTrunck.actionEngine()
kamazTrunck.actionWindow()
kamazTrunck.tankState = .full

print(kamazTrunck.description)
