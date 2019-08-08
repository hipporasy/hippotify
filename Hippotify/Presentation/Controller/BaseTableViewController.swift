//
//  BaseTableViewController.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/8/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit

class BaseTableViewController<T: BindableCell> : UITableViewController {
    
    var data: [T] = []

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")
        cell?.bind(with: data[indexPath.row])
        return cell!
    }
    
}

