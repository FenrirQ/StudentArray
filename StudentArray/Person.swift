//
//  Person.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var phoneNumber: String
    var imageData: Data?
    
    
    init(name: String, age: Int, phoneNumber: String, imageData: Data) {
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
        self.imageData = imageData
    }
    
}
