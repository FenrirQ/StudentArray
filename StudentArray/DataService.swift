//
//  DataService.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

class DataServices {
    static var shared: DataServices = DataServices()
    
    var students: [String] = ["Thắng", "Hiển", "Cường", "Đức"]
    
    
    func swap<T>(first: inout T, second: inout T) {
        let temp = first
        first = second
        second = temp
    }
    
    func reorder(from: Int, to: Int) {
        guard from != to else {return}
        swap(first: &students[from], second: &students[to])
    }
    
}
