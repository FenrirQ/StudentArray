//
//  TableViewController.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var tableViewDataSource = DataSource()
    var tableViewDelegate = Delegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        registerNotification()
        
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
        let Quang = Person(name: "Quang", age: 21, phoneNumber: "09xxx", imageData: UIImageJPEGRepresentation(UIImage(named: "Default")!, 1.0)!)
        DataServices.shared.appendStudent(person: Quang)
        DataServices.shared.saveStudents()
        tableView.insertRows(at: [IndexPath(row: DataServices.shared.students.count-1, section: 0)], with: .automatic)
        if DataServices.shared.students.isEmpty {
            presentAlert()
        }
    }

    func presentAlert() {
        let alert = UIAlertController(title: "Thông báo", message: "Đã xóa hết dữ liệu", preferredStyle: .alert)
        let alertOKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertOKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NotificationKey.didShowAlert, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func handleNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.presentAlert()
        }
    }
}
