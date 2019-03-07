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
    var favoriteFlights = Favorites.favoritesList
    var favoriteTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()

        // Do any additional setup after loading the view.
    }
    
    /*func flightAppend(){
        if (selectedFlight == nil){
            return;
        } else {
             favoriteFlights.append(selectedFlight)
        }
        UserDefaults.standard.set(favoriteFlights, forKey: "listFlights")
    }*/
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        favoriteTableView.reloadData()
    }
    



}
