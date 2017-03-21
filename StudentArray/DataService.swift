//
//  DataService.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

class DataService {
    static var service: DataService = DataService()
    private var _students = [String]()
    
    var students: [String] {
        set {
            _students = newValue
        }
        get {
            if _students.count == 0 {
                getData()
            }
            return _students
        }
    }
    
    func getData() {
        _students = ["Thắng", "Hiển", "Cường", "Đức"]
    }
    
    func swap<T>(first: inout T, second: inout T) {
        let temp = first
        first = second
        second = temp
    }
    
    func reorder(from: Int, to: Int) {
        guard from != to else {return}
        swap(first: &_students[from], second: &_students[to])
    }
    
}
