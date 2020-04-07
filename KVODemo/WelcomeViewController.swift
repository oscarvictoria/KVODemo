//
//  ViewController.swift
//  KVODemo
//
//  Created by Oscar Victoria Gonzalez  on 4/7/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    private var iconNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObservers()
        
    }
    
    private func configureObservers() {
        configureFontSizeObservations()
        configureIconNameObservation()
    }
    
    private func configureFontSizeObservations() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { (settings, change) in
            guard let newSize = change.newValue else  { return }
            let fontSize = CGFloat(newSize)
            self.welcomeLabel.font = UIFont.systemFont(ofSize: fontSize)
        })
    }

    private func configureIconNameObservation() {
        iconNameObservation = Settings.shared.observe(\.iconName, options: [.old,.new], changeHandler: { (settings, change) in
            guard let iconName = change.newValue else { return }
            self.iconImage.image = UIImage(systemName: iconName)
        })
    }

}

