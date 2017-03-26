//
//  Person.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    var name: String
    var age: Int
    var phoneNumber: String
    var imageData: Data?
    
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("students")
    
    init(name: String, age: Int, phoneNumber: String, imageData: Data) {
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
        self.imageData = imageData
    }
    
    struct PropertyKey {
        static let name = "name"
        static let age = "age"
        static let phoneNumber = "phoneNumber"
        static let imageData = "imageData"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(age, forKey: PropertyKey.age)
        aCoder.encode(phoneNumber, forKey: PropertyKey.phoneNumber)
        aCoder.encode(imageData, forKey: PropertyKey.imageData)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let age = aDecoder.decodeInteger(forKey: PropertyKey.age)
        let phoneNumber = aDecoder.decodeObject(forKey: PropertyKey.phoneNumber) as! String
        let imageData = aDecoder.decodeObject(forKey: PropertyKey.imageData) as! Data
        
        self.init(name: name, age: age, phoneNumber: phoneNumber, imageData: imageData)
    }
}
