//
//  ExamplesViewController.swift
//  Validator
//
//  Created by Adam Waite on 04/08/2015.
//  Copyright © 2015 adamjwaite.co.uk. All rights reserved.
//

import UIKit

class ExamplesViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    }
    
}

extension ExamplesViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "String Examples"
        default: return nil
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 6
        default: return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.section {
        
        case 0:
        
            let stringCell = tableView.dequeueReusableCellWithIdentifier("StringExample", forIndexPath: indexPath) as! StringExampleTableViewCell
            stringCell.validationRuleSet = ValidationRuleSet<String>()
            cell = stringCell
            
            switch indexPath.row {

            case 0:
                stringCell.titleLabel.text = "Minimum Length"
                stringCell.summaryLabel.text = "Ensures the input is at least 5 characters long using ValidationRuleLength"
                let minLengthRule = ValidationRuleLength(min: 5, failureMessage: "😫")
                stringCell.validationRuleSet?.addRule(minLengthRule)
            
            case 1:
                stringCell.titleLabel.text = "Maximum Length"
                stringCell.summaryLabel.text = "Ensures the input is at most 5 characters long using ValidationRuleLength"
                let maxLengthRule = ValidationRuleLength(max: 5, failureMessage: "😫")
                stringCell.validationRuleSet?.addRule(maxLengthRule)
                
            case 2:
                stringCell.titleLabel.text = "Range Length"
                stringCell.summaryLabel.text = "Ensures the input is between 5 and 10 characters long using ValidationRuleLength"
                let rangeLengthRule = ValidationRuleLength(min: 5, max: 10, failureMessage: "😫")
                stringCell.validationRuleSet?.addRule(rangeLengthRule)
                
            case 3:
                stringCell.titleLabel.text = "Email Address"
                stringCell.summaryLabel.text = "Ensures the input is a valid email address using ValidationRulePattern"
                let emailRule = ValidationRulePattern(pattern: .EmailAddress, failureMessage: "😫")
                stringCell.validationRuleSet?.addRule(emailRule)
            
            case 4:
                stringCell.titleLabel.text = "Contains Digit"
                stringCell.summaryLabel.text = "Ensures the input contains a digit using ValidationRulePattern"
                let minLengthRule = ValidationRulePattern(pattern: .ContainsNumber, failureMessage: "😫")
                stringCell.validationRuleSet?.addRule(minLengthRule)
                
            case 5:
                stringCell.titleLabel.text = "Is a Greeting"
                stringCell.summaryLabel.text = "Ensures the input is one of the greetings 'Hello', 'Hey' or 'Hi' using ValidationRuleConditiom"
                let minLengthRule = ValidationRuleCondition<String>(failureMessage: "😫") { ["Hello", "Hey", "Hi"].contains($0) }
                stringCell.validationRuleSet?.addRule(minLengthRule)
            
            default:
                break
            }
            
        default:
            break
        }
        
        return cell!
        
    }
    
}
