//
//  Favorites-UISetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FavoritesViewController {
    
    func tableViewSetup(){
        favoriteTableView = UITableView(frame: CGRect(x:0, y: 0, width: view.frame.width , height: view.frame.height))
        favoriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "flightCell")
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        favoriteTableView.backgroundColor = UIColor(red: 80 / 255, green: 101 / 255, blue: 161 / 255, alpha: 1)
        favoriteTableView.rowHeight = view.frame.height / 3
        favoriteTableView.showsVerticalScrollIndicator = false
        view.addSubview(favoriteTableView)
    }
    
    func init_nav_button () {
    }
}
