//
//  GetStartViewController.swift
//  Starter
//
//  Created by Premkumar  on 06/11/19.
//  Copyright © 2019 ktrkathir. All rights reserved.
//

import UIKit

/// StartViewController Dismiss protocol
protocol StarterViewDelegate {
    
    /// Continue button was tapped
    func continueButtonWasTapped(startViewController: StarterViewController)
}

/// StarterViewController
class StarterViewController: UIViewController {
    
    /// Dismiss delegate
    var delegate: StarterViewDelegate?

    /// Welcome label
    @IBOutlet weak var welcomeLabel: UILabel!
    
    /// App name label
    @IBOutlet weak var appNameLabel: UILabel!
    
    /// Feature description label
    @IBOutlet weak var featureDescriptionLabel: UILabel!
    
    /// Dismiss button
    @IBOutlet weak var dismiss: UIButton!
    
    /// Feature details
    var features: [FeatureDetail]? {
        didSet {
            updatefeatureDetail()
        }
    }
    
    /// Theme color
    var themeColor: UIColor = UIColor.blue {
        didSet {
            updateTheme()
        }
    }
    
    /// Features stackView
    @IBOutlet weak var featureStackView: UIStackView!
    
    /// Update Theme color
    fileprivate func updateTheme() {
        appNameLabel.textColor = themeColor
        dismiss.backgroundColor = themeColor
    }
    
    /// Update feature details
    fileprivate func updatefeatureDetail() {
        
        guard let details = features else { return print("feature detail is empty") }
        details.forEach({ (detail) in
            
            let featureView = FeatureView(frame: .zero, dataSource: detail)
            featureStackView.addArrangedSubview(featureView)
        })
    }
    
    /// Dismiss button clicked
    @IBAction func dismissButtonClicked(_ sender: Any) {
        
        if let delegate = delegate {
            delegate.continueButtonWasTapped(startViewController: self)
        }
        
    }
}

/// View controller extension
extension UIViewController {
    
    /// Load fromNib
    static func loadFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instanceFromNib()
    }
}
