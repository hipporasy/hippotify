//
//  ViewController.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit
import Kingfisher

class TrackViewController: BaseTableViewController<Track> {
    
    private var _repository: TrackRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        _repository = DirectTrackRepository()
        _repository.search(keyword: "Happier") { (tracks, error) in
            self.data = tracks ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
