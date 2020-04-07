//
//  SettingsViewController.swift
//  KVODemo
//
//  Created by Oscar Victoria Gonzalez  on 4/7/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    private var fontSizeObservation: NSKeyValueObservation?
    
    private let iconNames = ["sun.haze.fill", "moon", "globe", "icloud"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        configureFontSizeObservation()
    }
    
    private func configurePickerView() {
          pickerView.delegate = self
          pickerView.dataSource = self
      }
    
    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { (settings, change) in
            guard let fontSize = change.newValue else { return }
            self.sizeLabel.text = fontSize.description
        })
    }
    


    @IBAction func sliderChanged(_ sender: UISlider) {
        let newSize = Int(sender.value) // cast Float to integer
        Settings.shared.fontSize = newSize
        
    }
    
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iconNames.count
    }
    
}

extension SettingsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iconNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let iconName = iconNames[row]
        Settings.shared.iconName = iconName
    }
}
