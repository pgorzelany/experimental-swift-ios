//
//  BasicNavigationBar.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit

class BasicNavigationBar: UINavigationBar {

    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configureNavigationBar()
    }
    
    // MARK: Configruation
    
    func configureNavigationBar() {
        self.tintColor = UIColor.customBlue
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.titleTextAttributes = [NSFontAttributeName: UIFont.getFont(thickness: .regular, size: .big)]
    }
}
