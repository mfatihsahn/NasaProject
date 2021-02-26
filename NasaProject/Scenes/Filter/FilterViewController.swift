//
//  FilterViewController.swift
//  NasaProject
//
//  Created by FATIH on 24.02.2021.
//

import UIKit

enum FilterTypes: String{
    case SpiritFilter = "Spirit"
    case OppurtunityFilter = "Oppurtunity"
    case CuriosityFilter = "Curiosity"
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var backgroundGif: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var filterType : FilterTypes!
    var items : [String]!
    var delegate : filterProtocol?
    var camKey : String?
    var selectedIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundGif.loadGif(name: "spaceGif")
        
        switch filterType {
        case .SpiritFilter:
            self.items = otherCamArray
            selectedIndex = otherCamKeys.firstIndex(of: camKey ?? "")
        case .OppurtunityFilter:
            self.items = otherCamArray
            selectedIndex = otherCamKeys.firstIndex(of: camKey ?? "")
        default:
            self.items = curiosityCamArray
            selectedIndex = curiosityCamKeys.firstIndex(of: camKey ?? "")
            break
        }
        setupTableView()
    }
    
    func setupTableView(){
        tableView.register(FilterTableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func switchPressed(_ sender: UISwitch) {
        
        //Just to be able to choose one
        for i in 0..<items.count{
            if sender.tag == i {
                switch filterType {
                case .CuriosityFilter:
                    self.camKey = curiosityCamKeys[sender.tag]
                default:
                    self.camKey = otherCamKeys[sender.tag]
                    break
                }
                let indexPath = IndexPath(row: sender.tag, section: 0)
                
                let cell = tableView.cellForRow(at: indexPath) as! FilterTableCell
                
                if !cell.switchBtn.isOn {
                    cell.switchBtn.isOn = false
                    camKey = nil
                }
                else {
                    cell.switchBtn.isOn = true
                }
                
                tableView.deselectRow(at: indexPath, animated: true)
            }
            else{
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.cellForRow(at: indexPath) as! FilterTableCell
                cell.switchBtn.isOn = false
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }

    @IBAction func filterAction(_ sender: Any) {
        
        delegate?.filter(params: camKey)
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableViewDelegate Methods
extension FilterViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  50
    }
}
//MARK:- TableViewDataSource Methods
extension FilterViewController: UITableViewDataSource{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(FilterTableCell.self)!
        cell.switchBtn.tag = indexPath.row
        if indexPath.row == selectedIndex {
            cell.switchBtn.isOn = true
        }
        cell.switchBtn.addTarget(self, action: #selector(switchPressed), for: .valueChanged)
        cell.bindView(item)
        
        return cell
        
    }
    
}
