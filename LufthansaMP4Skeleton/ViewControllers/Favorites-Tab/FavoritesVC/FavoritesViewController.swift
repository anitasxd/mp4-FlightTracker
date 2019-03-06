//
//  FavoritesViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    var selectedFlight: Flight!
    var favoriteFlights = [Flight]()
    var favoriteTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        flightAppend()
        tableViewSetup()

        // Do any additional setup after loading the view.
    }
    
    func flightAppend(){
        favoriteFlights.append(selectedFlight)
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        favoriteTableView.reloadData()
    }


}
