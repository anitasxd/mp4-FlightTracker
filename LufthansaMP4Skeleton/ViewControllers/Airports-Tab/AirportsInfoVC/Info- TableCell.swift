//
//  Info- TableCell.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class InfoTableCell: UITableViewCell {
    var flightName: UILabel!
    var flightPath: UILabel!
    var flightTime: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        flightName = UILabel(frame: CGRect(x: 40, y: 0, width: 300, height: 20))
        flightName.font = UIFont(name: "Helvetica", size: 14)
        
        flightPath = UILabel(frame: CGRect(x: 40, y: flightName.frame.maxY + 10, width: 300, height: 25))
        flightPath.font = UIFont(name: "Helvetica", size: 14)
        
        flightTime = UILabel(frame: CGRect(x: 40, y: flightPath.frame.maxY + 10, width: 300, height: 25))
        flightTime.font = UIFont(name: "Helvetica", size: 14)
        contentView.addSubview(flightName)
        contentView.addSubview(flightPath)
        contentView.addSubview(flightTime)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
