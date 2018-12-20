//
//  HomeTopControlsStackView.swift
//  NewTinder
//
//  Created by Martin Gallardo on 12/16/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class HomeTopControlsStackView: UIStackView {
    let settBtn = UIButton(type: .system)
     let messageBtn = UIButton(type: .system)
    let fireImage = UIImageView(image: #imageLiteral(resourceName: "app_icon"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        fireImage.contentMode = .scaleAspectFit
        distribution = .equalCentering
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        settBtn.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageBtn.setImage(#imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        [settBtn,UIView(),fireImage,UIView(),messageBtn].forEach { (v) in
            addArrangedSubview(v)
        }
        
        
//
//        let bottomStack = [#imageLiteral(resourceName: "top_left_profile"),#imageLiteral(resourceName: "app_icon"),#imageLiteral(resourceName: "top_right_messages")].map { (img) -> UIView in
//            let v = UIButton(type: .system)
//            v.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
//            return v
//        }
//        bottomStack.forEach { (v) in
//            addArrangedSubview(v)
//        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
