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
        favoriteTableView.register(FavoritesCellTableViewCell.self, forCellReuseIdentifier: "flightCell")
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        favoriteTableView.rowHeight = view.frame.height / 3
        self.view.addSubview(favoriteTableView)
    }
    
}
