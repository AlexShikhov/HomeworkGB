//
//  main.swift
//  HomeworkGeekbrains
//
//  Created by Александр on 18.10.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

// ПЕРВАЯ ЗАДАЧА

let firstCoef: Double = 1  // Введите значения для первого, второго множителя
let secCoef: Double = 10   // и свободного члена соответственно. Значение firstCoef
let constTerm: Double = 5  // не может быть равным 0.

let variableOne: Double    // Первый корень
let variableTwo: Double    // Второй корень

let discr: Double = pow(secCoef, 2) - (4 * firstCoef * constTerm) // Формула Дискриминанта

if discr >= 0 {
    variableOne = (-secCoef + sqrt(discr)) / (2 * firstCoef)
    variableTwo = (-secCoef - sqrt(discr)) / (2 * firstCoef)

    print("Значение первого корня - \(variableOne)")
    print("Значение второго корня - \(variableTwo)")

} else {
    print ("No answer(")
}

//ВТОРАЯ ЗАДАЧА

let firstLeg: Double = 5  //Введите значения первого и второго катета соответственно
let secondLeg: Double = 6 // Их значения не могут равняться 0

let hypotenuse: Double = sqrt (pow ( firstLeg,2) + pow (secondLeg,2)) //Поиск гипотенузы
let square = firstLeg * secondLeg * 0.5 // Поиск площади
let perimeter = firstLeg + secondLeg + hypotenuse  //  Поиск периметра

print("Периметр равен - \(perimeter)")
print ("Гипотенуза равна - \(hypotenuse)")
print("Площадь равна - \(square)")



//ТРЕТЬЯ ЗАДАЧА


let bank: Double = 5000 // Введите сумму вклада
let procent: Double = 6 // Введите годовой процент
var profit = bank

for _  in 1...5 {
    profit = profit + profit * procent / 100
}

print("Сумма вклада - \(bank)")
print("Сумма вклада через 5 лет - \(profit)")
print ("За пять лет накоплено - \(profit - bank)")
