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
    
    @IBOutlet weak var tableView: UITableView!
    
    var formVM = FormViewModel()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        registerFormComponents()
    }
    
    // MARK: - Form Components
    func registerFormComponents() {
        formVM.reuseIdentifiers().forEach {
            self.tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    // MARK: - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formVM.activeForm().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: formVM.activeForm()[indexPath.row].rawValue, for: indexPath)
    }
    
    // MARK: - Swap form
    func swap(step i:Int) {
        
        let (added, removed) = formVM.swap(step: i)
        
        tableView?.beginUpdates()
        tableView?.insertRows(at: added, with: .fade)
        tableView?.deleteRows(at: removed, with: .fade)
        tableView?.endUpdates()
    }
    
    @IBAction func next() {
        swap(step: 1)
    }
    
    @IBAction func prev() {
        swap(step: -1)
    }
}

