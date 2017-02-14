//
//  ViewController.swift
//  MVVM
//
//  Created by João Pereira on 31/01/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import UIKit
import SwiftLCS

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Form types
    let form1 = [Field.picture]
    let form2 = [Field.input, Field.password]
    
    var currentForm:[Field] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        currentForm = form1
        
        tableView.delegate = self
        tableView.dataSource = self
        registerFormComponents()
    }
    
    // MARK: - Form Components
    func registerFormComponents() {
        
        let combined = Set<String>((form1 + form2).map { $0.rawValue})
        
        combined.forEach {
            self.tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    // MARK: - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentForm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: currentForm[indexPath.row].rawValue, for: indexPath)
    }
    
    // MARK: - Swap form
    @IBAction func swap(_ sender: Any) {
            
        let diff = form1.diff(form2)
    
        let added = diff.addedIndexes.map { IndexPath(row: $0, section: 0) }
        let removed = diff.removedIndexes.map { IndexPath(row: $0, section: 0) }
    
        currentForm = form2
        tableView?.beginUpdates()
        tableView?.insertRows(at: added, with: .fade)
        tableView?.deleteRows(at: removed, with: .fade)
        tableView?.endUpdates()
    }
}

