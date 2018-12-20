//
//  CardViewModel.swift
//  NewTinder
//
//  Created by Martin Gallardo on 12/17/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
protocol ProducessCardViewModel {
    func toCardViewModel() -> CardViewModel
}

struct CardViewModel {
    let imageNames: [String]
    let attributedString: NSMutableAttributedString
    let textAligment: NSTextAlignment
    
}



