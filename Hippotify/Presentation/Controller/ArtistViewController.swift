//
//  ArtistViewController.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/8/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit

class ArtistViewController: BaseTableViewController<Artist> {

    private var _repository: ArtistRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _repository = DirectArtistRepository()
        _repository.search(keyword: "Ed") { (artists, error) in
            self.data = artists ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

