//
//  FavoritesCellTableViewCell.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class FavoritesCellTableViewCell: UITableViewCell {
    
    var flightName: UILabel!
    var flightPath: UILabel!
    var flightStatus: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 80 / 255, green: 101 / 255, blue: 161 / 255, alpha: 1)
        
        flightName = UILabel(frame: CGRect(x: 40, y: 275, width: 300, height: 25))
        flightName.font = UIFont(name: "Avenir", size: 24)
        flightName.textColor = .white
        
        flightPath = UILabel(frame: CGRect(x: 40, y: 275, width: 300, height: 25))
        flightPath.font = UIFont(name: "Avenir", size: 24)
        flightPath.textColor = .white
        
        flightStatus = UILabel(frame: CGRect(x: 40, y: 275, width: 300, height: 25))
        flightStatus.font = UIFont(name: "Avenir", size: 24)
        flightStatus.textColor = .white

        contentView.addSubview(flightName)
        contentView.addSubview(flightPath)
        contentView.addSubview(flightStatus)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
