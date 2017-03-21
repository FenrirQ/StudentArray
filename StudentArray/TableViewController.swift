//
//  TableViewController.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func addRow(_ sender: UIBarButtonItem) {
        DataService.service.students.append("Quang")
        tableView.insertRows(at: [IndexPath(row: DataService.service.students.count-1, section: 0)], with: .automatic)
    }

}
