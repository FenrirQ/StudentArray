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
    private var _students: [Person]?
    
    var students: [Person] {
        get {
            if _students == nil {
                _students = loadStudents()
            }
            return _students!
        }
        set {
            _students = newValue
        }
    }
    let img = UIImage(named: "Default")
    
    func swap<T>(first: inout T, second: inout T) {
        let temp = first
        first = second
        second = temp
    }
    
    func reorder(from: Int, to: Int) {
        guard from != to else {return}
        swap(first: &_students![from], second: &_students![to])
        saveStudents()
    }
    
    func appendStudent(person: Person) {
        students.append(person)
    }
    
    func saveStudents() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(_students!, toFile: Person.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Students successful saved", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save students", log: OSLog.default, type: .debug)
        }
    }
    
    func loadStudents() -> [Person] {
        let students = NSKeyedUnarchiver.unarchiveObject(withFile: Person.ArchiveURL.path) as? [Person]
        if students == nil {
            _students = loadSampleStudents()
            saveStudents()
        }
        return _students!
    }
    
    func loadSampleStudents() -> [Person] {
        let data = UIImageJPEGRepresentation(img!, 1.0)
        
        let Thang: Person = Person(name: "Thắng", age: 32, phoneNumber: "09xxx", imageData: data!)
        let Cuong: Person = Person(name: "Cường", age: 28, phoneNumber: "09xxx", imageData: data!)
        let Hoang: Person = Person(name: "Hoàng", age: 25, phoneNumber: "09xxx", imageData: data!)
        let Duc: Person = Person(name: "Đức", age: 23, phoneNumber: "09xxx", imageData: data!)
        return [Thang, Cuong, Hoang, Duc]
    }
    
}
