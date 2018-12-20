//
//  ViewController.swift
//  NewTinder
//
//  Created by Martin Gallardo on 12/16/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    let topStackView = HomeTopControlsStackView()
    let bottomStackView = HomeBottomControlsStackView()
    
    let cardDeckView = UIView()
    
//   let user = [
//    User(name: "Jissel", age: 27, profession: "Backer", imageName: "lady5c"),
//    User(name: "jane", age: 18, profession: "Theacher", imageName: "lady4c")
//    ]
    let cardViewModel: [CardViewModel] = {
        let producer = [
            
            User(name: "Jissel", age: 27, profession: "Backer", imageNames: ["lady5c","lady4c","lady5c"]),
            User(name: "jane", age: 18, profession: "Theacher", imageNames: ["lady4c"]),
            Advertiser(title: "Slide out menu", brandName: "CoolDeveloper", posterPhotoName: "FightWounds")
        ] as[ProducessCardViewModel]
        
        let viewModel = producer.map({return $0.toCardViewModel()})
        return viewModel
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLayout()    
        setupDummycard()
    }

    fileprivate func setupDummycard() {
        
        
        cardViewModel.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardVM
            cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
            
        }
       
    }
    //MARK:- ViewLayout
    fileprivate func viewLayout() {
       
        
        let overrallStack = UIStackView(arrangedSubviews: [topStackView,cardDeckView,bottomStackView])
        
        view.addSubview(overrallStack)
        overrallStack.axis = .vertical
        overrallStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overrallStack.isLayoutMarginsRelativeArrangement = true
        overrallStack.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        overrallStack.bringSubviewToFront(cardDeckView)
    }
}

