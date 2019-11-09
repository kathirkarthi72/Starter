//
//  FeaturedView.swift
//  Starter
//
//  Created by Premkumar  on 06/11/19.
//  Copyright © 2019 ktrkathir. All rights reserved.
//

import UIKit

/// Feature view
class FeatureView: UIView {
    
    /// Icon view
    @IBOutlet weak var iconView: UIImageView!
    
    /// Title label
    @IBOutlet weak var titleLabel: UILabel!
    
    /// Description label
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Feature detail
    var featureDetail: FeatureDetail?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitSetup()
    }
    
    init(frame: CGRect, dataSource: FeatureDetail) {
        super.init(frame: frame)
        self.featureDetail = dataSource
        
        commonInitSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInitSetup()
    }
    
    /// Common init setup
    func commonInitSetup() {
        
        let loadedView = Bundle.main.loadNibNamed("FeatureView", owner: self, options: nil)?.first as! UIView
        loadedView.frame = bounds
        addSubview(loadedView)
        
        loadData()
    }
    
    /// Load data
    func loadData() {
        
        guard let detail = featureDetail else { return }
        
        iconView.image = detail.icon
        titleLabel.text = detail.title
        descriptionLabel.text = detail.subTitle
    }
}
