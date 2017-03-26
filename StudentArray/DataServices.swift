//
//  DataService.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit
import os.log

class DataServices {
    static var shared: DataServices = DataServices()
    
    var students: [Person] = []
    let img = UIImage(named: "Default")
    
    init() {
        let data = UIImageJPEGRepresentation(img!, 1.0)
        
        let Thang: Person = Person(name: "Thắng", age: 32, phoneNumber: "09xxx", imageData: data!)
        let Cuong: Person = Person(name: "Cường", age: 28, phoneNumber: "09xxx", imageData: data!)
        let Hoang: Person = Person(name: "Hoàng", age: 25, phoneNumber: "09xxx", imageData: data!)
        let Duc: Person = Person(name: "Đức", age: 23, phoneNumber: "09xxx", imageData: data!)
        students = [Thang, Cuong, Hoang, Duc]
    }
    
    func swap<T>(first: inout T, second: inout T) {
        let temp = first
        first = second
        second = temp
    }
    
    func reorder(from: Int, to: Int) {
        guard from != to else {return}
        swap(first: &students[from], second: &students[to])
        saveStudents()
    }
    
    func saveStudents() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(students, toFile: Person.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Students successful saved", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save students", log: OSLog.default, type: .debug)
        }
    }
    
    func loadStudents() -> [Person]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Person.ArchiveURL.path) as? [Person]
    }
    
}