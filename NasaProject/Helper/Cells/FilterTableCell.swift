//
//  FilterTableCell.swift
//  NasaProject
//
//  Created by FATIH on 24.02.2021.
//

import UIKit

class FilterTableCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    func bindView(_ item : String)  {
        lblTitle.text = item
    }
    
}
