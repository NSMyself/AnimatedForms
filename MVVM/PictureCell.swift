//
//  PictureCell.swift
//  MVVM
//
//  Created by João Pereira on 13/02/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import UIKit

class PictureCell:UITableViewCell, FormCell {
    static let identifier = "PictureCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Configure Cell
        selectionStyle = .none
        backgroundColor = UIColor.green
    }
}
