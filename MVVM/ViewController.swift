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
    
        tableView.sectionHeaderHeight = 0
        tableView.estimatedSectionHeaderHeight = UITableViewAutomaticDimension
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        tableView.sectionFooterHeight = 0
        tableView.estimatedSectionFooterHeight = UITableViewAutomaticDimension
        
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
        return formVM.active().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: formVM.active()[indexPath.row].rawValue, for: indexPath)
        let viewModel = formVM.active()
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

