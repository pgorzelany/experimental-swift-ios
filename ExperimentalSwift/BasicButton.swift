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
    
    // MARK: Properties
    
    private let defaultHeight: CGFloat = 44

    // MARK: Lifecycle
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureButton()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.height / 2.0
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configureButton()
    }
    
    // MARK: Configuration
    
    private func configureButton() {
        clipsToBounds = true
        titleLabel?.font = UIFont.getFont(thickness: .regular, size: .regular)
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor.customBlue
        heightAnchor.constraint(equalToConstant: defaultHeight).isActive = true
    }
}
