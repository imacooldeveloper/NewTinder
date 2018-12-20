//
//  Advertiser.swift
//  NewTinder
//
//  Created by Martin Gallardo on 12/17/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

struct Advertiser:ProducessCardViewModel {
    let title: String
    let brandName: String
    let posterPhotoName: String
    
    func toCardViewModel() -> CardViewModel {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 34, weight: .heavy)])
        attributedString.append(NSMutableAttributedString(string: "\n" + brandName, attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]))
        
        return CardViewModel(imageNames: [posterPhotoName], attributedString: attributedString, textAligment: .center)
    }
}


