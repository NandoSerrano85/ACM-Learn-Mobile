//
//  DateAndTimeView.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/5/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class DateAndTimeView: UIViewController {
    
    @IBOutlet var dateTitle: UILabel!
    @IBOutlet var timeButtonCollection: [UIButton]!
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var popUp: UIView!
    
    let daysAvailable: [String:[String]] = ["Monday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Tuesday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Wednesday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Thursday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Friday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"]]
    
    var dayIndex: Int = 0
    let days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        popUp.isHidden = true
        UISetup()
    }
    
    func UISetup(){
        let day = days[dayIndex]
        dateTitle.text = day
        for n in 0...3 {
            timeButtonCollection[n].setTitle(daysAvailable[day]?[n], for: .normal)
        }
    }
    
    func popUpView() {
        let customViewFrame = CGRect.init(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
        popUp = UIView(frame: customViewFrame)
        
        view.addSubview(popUp)
        popUp.isHidden = false
        
        let doneLabelFrame = CGRect.init(x: 40.0, y: 1000.0, width: 50, height: 50)
        let doneLabel = UILabel.init(frame: doneLabelFrame)
        doneLabel.text = "Done!"
        
        popUp.addSubview(doneLabel)
        
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        dayIndex += 1
        if nextButton.currentTitle == "Finished" {
            popUpView()
        } else if dayIndex == 4 {
            nextButton.setTitle("Finished", for: .normal)
            UISetup()
        } else {
            UISetup()
        }
        
    }
    
    
}
