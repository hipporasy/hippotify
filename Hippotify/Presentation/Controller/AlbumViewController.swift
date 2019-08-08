//
//  ArtistViewController.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/8/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit

class AblumViewController: BaseTableViewController<Album> {

    private var _repository: AlbumRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _repository = DirectAlbumRepository()
        _repository.search(keyword: "Divide") { (albums, error) in
            self.data = albums ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
