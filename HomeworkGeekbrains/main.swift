//
//  main.swift
//  HomeworkGeekbrains
//
//  Created by Александр on 18.10.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

// ПЕРВОЕ ЗАДАНИЕ

func evenOdd(number: Int) -> String {
    if number % 2 == 0 {
        return "Число чётное"
    } else {
        return "Число нечётное"
    }
}

// ВТОРОЕ ЗАДАНИЕ

func zeroFromThree(number: Int) -> String {
    if number % 3 == 0 {
        return "Число делится без остатка на 3"
    } else {
        return "Остаток от деления - \(number % 3)"
    }
}

// ТРЕТЬЕ ЗАДАНИЕ

var numbers = [Int]()

for i: Int in 0...99 {
    numbers.append(i + 1)
}

//ЧЕТВЕРТОЕ ЗАДАНИЕ

var newNumbers = [Int]()
for i: Int in 0...99 {
    if i > numbers.count{
        break
    }else if numbers[i] % 2 != 0 && numbers[i] % 3 == 0 {
        newNumbers.append(numbers[i])
    }
}
    numbers = newNumbers

// ПЯТОЕ ЗАДАНИЕ. Числа Фибоначчи

func Fibonachi(howMuchNumbers: Int) -> [Int]{
    var array = [0,1]
    switch howMuchNumbers {
    case 1:
        array.removeLast()
    case 2:
        return array
    default:
        for i: Int in 2...howMuchNumbers-1{

        array.append(array[i - 1] + array [i - 2])
        }
    }
    return array
}

print (Fibonachi(howMuchNumbers: 2))

// ШЕСТОЕ ЗАДАНИЕ. Заполнить массив элементов различными простыми числами.

func easyNumbers(max: Int) -> [Int] {   // max - максимальное число диапазона чисел
        
    // Создаем два массива: один для чисел от 2 до 100, второй для простых чисел
    var allNumbers = [Int]()
    var easyNumbers = [Int]()
    //Наполняем первый массив числами от 2 до 100
    for i: Int in 2...max {
        allNumbers.append(i)
    }
    //Иначальный шаг для решета Эратосфена - 2
    var step = 2

    while step * step <= max {
    // Цикл для "фильтации" массива через решето с шагом step
        for i: Int in stride(from: step * step - 2, to: max, by: step) {
            if i > max - 2{
                    break
                }
            allNumbers [i] = 0
            }
    //Цикл для определения следующего простого числа и шага
        for i in step - 1 ... allNumbers.count  {
            if i >= allNumbers.count {
                break
            }
        if allNumbers[i] != 0 {
            step = allNumbers [i]
            print (step)
            break
            }
        }
    }
    // "Очистка" массива от нулей
    for i in 0 ... allNumbers.count - 2 {
        if allNumbers [i] != 0 {
            easyNumbers.append(allNumbers[i])
        }
    }

    return easyNumbers
}

print(easyNumbers(max: 200))
