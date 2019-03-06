//
//  FlightSearch-UISetupViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FlightSearchViewController{

    func flightSearchUISetup(){
        view.backgroundColor = UIColor(red: 80 / 255, green: 101 / 255, blue: 161 / 255, alpha: 1)
        flightNumberTextfield = UITextField(frame: CGRect(x: view.frame.width/3, y: view.frame.height/2, width: view.frame.width/2, height: 35))
        flightNumberTextfield.placeholder = "Flight Number"
        flightNumberTextfield.textAlignment = .center
        flightNumberTextfield.backgroundColor = .white
        flightNumberTextfield.layer.cornerRadius = 15
        view.addSubview(flightNumberTextfield)
        
        flightDatePicker = UIDatePicker(frame: CGRect(x: 0, y: view.frame.height/2 + 50, width: view.frame.width, height: 80))
        flightDatePicker.datePickerMode = UIDatePicker.Mode.date
        flightDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        view.addSubview(flightDatePicker)
        
        label = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        label.text = "This will be flight status"
        label.textAlignment = .center
        view.addSubview(label)
        
        button = UIButton(frame: CGRect(x: 50, y: 200, width: view.frame.width - 100, height: 50))
        button.backgroundColor = .blue
        button.setTitle("Get Flight", for: .normal)
        button.addTarget(self, action: #selector(searchbuttonPress), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func searchbuttonPress(_ sender: Any) {
        let inputDate = dateFormatter(flightDatePicker.date)
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getFlightStatus(flightNum: "\(self.flightNumberTextfield!.text!)", date: "\(inputDate)") { (flightRecord) in
                self.label.text = flightRecord.timeStatus
                self.inputFlight = flightRecord
                self.performSegue(withIdentifier: "toFlightInfo", sender: self)
            }
        }
    }
    
    private func dateFormatter(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FlightInfoViewController {
            destination.userFlight = inputFlight
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
