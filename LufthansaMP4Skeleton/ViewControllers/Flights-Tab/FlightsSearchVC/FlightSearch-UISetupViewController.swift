//
//  FlightSearch-UISetupViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FlightSearchViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
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
        
        searchbutton = UIButton(frame: CGRect(x: 50, y: 200, width: view.frame.width - 100, height: 50))
        searchbutton.backgroundColor = .blue
        searchbutton.setTitle("Get Flight", for: .normal)
        searchbutton.addTarget(self, action: #selector(searchbuttonPress), for: .touchUpInside)
        view.addSubview(searchbutton)
    }
    
    @objc func searchbuttonPress(_ sender: Any) {
        if (flightNumberTextfield!.text == "") {
            inputError()
            return
        }
        
        let inputDate = dateFormatter(flightDatePicker.date)
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getFlightInfo(flightNum: "\(self.flightNumberTextfield!.text!)", date: "\(inputDate)") { (flightRecord) in
                if (flightRecord.originAirport == ""){
                    self.inputError()
                    return
                }
                self.label.text = flightRecord.timeStatus
                self.inputFlight = flightRecord
                self.performSegue(withIdentifier: "toFlightInfo", sender: self)
            }
        }
    }
    
    func inputError(){
        let alert = UIAlertController(title: "Error!", message: "Please check your inputs!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        searchbutton.isUserInteractionEnabled = true
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
}
