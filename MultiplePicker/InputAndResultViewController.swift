//
//  InputAndResultViewController.swift
//  MultiplePicker
//
//  Created by Richard Stockdale on 24/06/2018.
//  Copyright © 2018 JunctionSeven. All rights reserved.
//

import UIKit

class InputAndResultViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! MultiPickerViewController
        
        var items = [PickerItem]()
        
        for str in getEntryAsArray() {
            items.append(PickerItem(title: str, isTicked: false))
        }
        
        destinationVC.createMultiplePicker(named: "Select", withItems: items) { (pickerItems) in
            // Do Something with the data
        }
    }

    private func getEntryAsArray() -> [String] {
        let str = textField.text
        
        guard let itemSplit = str?.split(separator: ",") else {
            return [String]()
        }
        
        var items = [String]()
        for item in itemSplit {
            items.append(String(item))
        }
        
        return items
    }
}
