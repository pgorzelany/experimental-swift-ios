//
//  BaseLabel.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 07/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit

@IBDesignable
public class BasicLabel: UILabel {
    
    // MARK: Lifecycle

    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureLabel()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configureLabel()
    }
    
    // MARK: Configuration
    
    private func configureLabel() {
        font = UIFont.getFont(thickness: .medium, size: .regular)
    }
}
