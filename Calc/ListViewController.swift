//
//  ListViewController.swift
//  Calc
//
//  Created by Oliver Paray on 9/23/19.
//  Copyright © 2019 Oliver Paray. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var list = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return list.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellIdentifier", for: indexPath)
        
        switch indexPath.section {
        case 0:
            guard let textLabel = cell.textLabel else { return cell }
            textLabel.font = UIFont.systemFont(ofSize: 40.0)
            textLabel.textColor = UIColor.blue
            textLabel.text = "Done"
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            self.dismiss(animated: true) {
            }
        }
    }

}
