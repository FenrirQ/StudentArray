//
//  DataSource.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit


class DataSource: NSObject, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfSections: Int = 0
        if(DataServices.shared.students.count > 0) {
            tableView.separatorStyle = .singleLine
            numberOfSections = 1
            
        } else{
            NotificationCenter.default.post(name: NotificationKey.didShowAlert, object: nil)
        }
        return numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return DataServices.shared.students.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentTableViewCell
        cell.nameLabel.text = DataServices.shared.students[indexPath.row].name
        cell.phoneNumberLabel.text = DataServices.shared.students[indexPath.row].phoneNumber
        cell.imgView?.image = UIImage(data: DataServices.shared.students[indexPath.row].imageData!)
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            DataServices.shared.students.remove(at: indexPath.row)
            DataServices.shared.saveStudents()
            tableView.reloadData()
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }
    }
    
    
    
     // Override to support rearranging the table view.
     func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         DataServices.shared.reorder(from: fromIndexPath.row, to: to.row)
     }
    
    
    
     // Override to support conditional rearranging of the table view.
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
        return true
     }
     

    
}
struct NotificationKey {
    static let didShowAlert = NSNotification.Name(rawValue: "didShowAlert")
}
