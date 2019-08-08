//
//  UITableViewCell+Extension.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/8/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func bind(with bindableCell: BindableCell) {
        textLabel?.text = bindableCell.title
        detailTextLabel?.text = bindableCell.description
        imageView?.kf.indicatorType = .activity
        
        guard let imageURL = URL(string: bindableCell.image) else {
            return
        }
        imageView?.kf.setImage(with: imageURL)
    }
    
}
