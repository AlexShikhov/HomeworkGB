////
////  main.swift
////  HomeworkGeekbrains
////
////  Created by Александр on 18.10.2021.
////  Copyright © 2021 Александр. All rights reserved.
//
import Foundation

enum engineState {
    case start, stop
}

enum windowState {
    case open, close
}

enum trunkState {
    case full, nonFull, empty
}

struct someCar {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(colour:String) {
        switch colour {
        case "белый":
            self.color = "белый"
        case "красный":
            self.color = "красный"
        case "черный":
            self.color = "черный"
        case "синий":
            self.color = "синий"
        default:
            print("Данного цвета нет в комплектации")
        }
    }
    let release : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .nonFull || trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue <= trunkVolume) {
                let space = trunkVolume - newValue
                self.trunkState = .nonFull
                print ("\(brand)\(model): было загружено - \(space), оставшееся место - \(newValue)")
            } else {
                print("Некорректный ввод или у \(brand)\(model) полный багажник")
                
            }
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) двигатель включен")
            } else {print("\(brand)\(model) двигатель выключен")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) окна открыты")
            } else { print("\(brand)\(model) окна закрыты") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand)\(model) багажник пуст")
    }
}

struct someTruck {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(colour:String) {
        switch colour {
        case "белый":
            self.color = "белый"
        case "красный":
            self.color = "красный"
        case "черный":
            self.color = "черный"
        case "синий":
            self.color = "синий"
        default:
            print("Данного цвета нет в комплектации")
        }
    }
    let release : Int
    var bodyVolume : Double {
        willSet {
            if (trunkState == .nonFull || trunkState == .empty) && (bodyVolume > 0) && (bodyVolume != 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                self.trunkState = .nonFull
                print ("\(brand)\(model): было загружено - \(space), оставшееся место - \(newValue)")
            } else { print("Неверный ввод или у \(brand)\(model) полный багажник")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) двигатель включен")
            } else {print("\(brand)\(model) двигатель выключен")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand) \(model) окна открыты")
            } else { print("\(brand)\(model) окна закрыты") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand)\(model) багажник пуст")
    }
}

var carAudiOld = someCar(brand: "Audi", model: "80", color: "красный", release: 1991, trunkVolume: 370, engineState: .stop, windowState: .close, trunkState: .nonFull)
var carAudiNew = someCar(brand: "Audi", model: "A6", color: "черный", release: 2018, trunkVolume: 565, engineState: .stop, windowState: .close, trunkState: .nonFull)

carAudiNew.engineState = .start
carAudiOld.engineState = .stop
carAudiOld.engineState = .start
print(carAudiNew.trunkVolume)
carAudiOld.trunkVolume = 15
carAudiOld.emptyTrunck()
carAudiOld.trunkVolume = 15

carAudiNew.trunkVolume = 100
carAudiNew.trunkVolume = 14

carAudiNew.emptyTrunck()

var truckVolvo = someTruck(brand: "Volvo", model: "FH16", color: "белый", release: 2012, bodyVolume: 105000, engineState: .stop, windowState: .close, trunkState: .nonFull)
var truckMan = someTruck(brand: "Man", model: "TGX", color: "синий", release: 2020, bodyVolume: 126100, engineState: .stop, windowState: .close, trunkState: .nonFull)

truckVolvo.engineState = .start
truckVolvo.engineState = .stop
truckVolvo.changeColor(colour: "желтый")
truckVolvo.changeColor(colour: "черный")
print("Цвет \(truckVolvo.brand)\(truckVolvo.model) - \(truckVolvo.color)")
truckMan.windowState = .open

truckMan.bodyVolume = 25000
truckMan.bodyVolume = 0
truckMan.bodyVolume = 1
truckMan.emptyTrunck()


print("Информация о легковом автомобиле \(carAudiOld.brand)\(carAudiOld.model): состояние двигателя - \(carAudiOld.engineState), состояние окон - \(carAudiOld.windowState), цвет - \(carAudiOld.color), дата выпуска - \(carAudiOld.release), свободный объем багажника - \(carAudiOld.trunkVolume), багажник - \(carAudiOld.trunkState)")

print("Информация о легковом автомобиле \(carAudiNew.brand)\(carAudiNew.model): состояние двигателя - \(carAudiNew.engineState), состояние окон - \(carAudiNew.windowState), цвет - \(carAudiNew.color), дата выпуска - \(carAudiNew.release), свободный объем багажника - \(carAudiNew.trunkVolume), багажник - \(carAudiNew.trunkState)")


print("Информация о легковом автомобиле \(truckMan.brand)\(truckMan.model): состояние двигателя - \(truckMan.engineState), состояние окон - \(truckMan.windowState), цвет - \(truckMan.color), дата выпуска - \(truckMan.release), свободный объем багажника - \(truckMan.bodyVolume), багажник - \(truckMan.trunkState)")
print("Информация о легковом автомобиле \(truckVolvo.brand)\(truckVolvo.model): состояние двигателя - \(truckVolvo.engineState), состояние окон - \(truckVolvo.windowState), цвет - \(truckVolvo.color), дата выпуска - \(truckVolvo.release), свободный объем багажника - \(truckVolvo.bodyVolume), багажник - \(truckVolvo.trunkState)")
