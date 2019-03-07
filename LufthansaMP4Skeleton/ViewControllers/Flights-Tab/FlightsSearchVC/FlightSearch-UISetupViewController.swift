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
        welcomeImage  =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        welcomeImage.image = UIImage(named: "welcome")
        view.addSubview(welcomeImage)
        
        flightLabel = UILabel(frame: CGRect(x: 70, y: view.frame.height/2, width: 60, height: 35))
        flightLabel.text = "Flight: "
        flightLabel.textAlignment = .center
        flightLabel.font = UIFont(name: "Helvetica", size: 20)
        flightLabel.textColor = .white
        view.addSubview(flightLabel)
        
        
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
        
        searchbutton = UIButton(frame: CGRect(x: view.frame.width/3.5, y: flightDatePicker.frame.maxY + 50, width: view.frame.width/2, height: 30))
        searchbutton.setTitle("Get Flight", for: .normal)
        searchbutton.backgroundColor = UIColor(red:0.57, green:0.70, blue:0.95, alpha:1.0)
        searchbutton.layer.cornerRadius = 12
        searchbutton.setTitleColor(.white, for: .normal)
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
