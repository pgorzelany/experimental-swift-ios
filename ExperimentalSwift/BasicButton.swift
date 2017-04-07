//
//  BasicButton.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 07/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit

@IBDesignable
public class BasicButton: UIButton {

    // MARK: Lifecycle
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureButton()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configureButton()
    }
    
    // MARK: Configuration
    
    private func configureButton() {
        backgroundColor = UIColor.blue
        setTitleColor(UIColor.white, for: .normal)
    }
}
