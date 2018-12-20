//
//  HomeBottomControlsStackView.swift
//  NewTinder
//
//  Created by Martin Gallardo on 12/16/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        let bottomStack = [#imageLiteral(resourceName: "refresh_circle"),#imageLiteral(resourceName: "dismiss_circle"),#imageLiteral(resourceName: "super_like_circle"),#imageLiteral(resourceName: "like_circle"),#imageLiteral(resourceName: "boost_circle")].map { (img) -> UIView in
            let v = UIButton(type: .system)
            v.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            return v
        }
        bottomStack.forEach { (v) in     
            addArrangedSubview(v)
        }
    
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
