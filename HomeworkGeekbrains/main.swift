//
//  main.swift
//  HomeworkGeekbrains
//
//  Created by Александр on 18.10.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

struct Queue<T> {
    var people = [T]()
    var count: Int {
        return people.count
    }
  

    mutating func addMan(name: T){
        people.append(name)
    }
    mutating func addPeople(names: [T]){
        people.append(contentsOf: names)
    }
    
    mutating func removeMan() -> T?{
        if people.count > 0 {
            return people.removeFirst()
        } else {
            return nil
        }
    }
    
    func filter(array: [T], predicateSomeClosure: (T) -> Bool) -> [T]{
        var tmpArray = [T]()
        for element in array{
            if predicateSomeClosure(element){
                tmpArray.append(element)
            }
        }
        return tmpArray
    }  
    subscript(index: Int) -> T?{
        if index > people.count || index < 0{
            return nil
        }else{
            return people[index]
        }
    }
    
}

var queue = Queue<Int>()
queue.addPeople(names: [1,2,3,4,5,6,7,8,9,10,11,12,13])
print(queue)

queue.addMan(name: 14)
print(queue)


let filteredQueue = queue.filter(array: queue.people) { (number: Int) -> Bool in
    return number % 2 == 0
}
print(filteredQueue)

print(queue[15])
