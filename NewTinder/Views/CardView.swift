//
//  CardView.swift
//  NewTinder
//
//  Created by Martin Gallardo on 12/16/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class CardView: UIView {
    var cardViewModel: CardViewModel! {
        didSet{
            let imageName = cardViewModel.imageNames.first ?? ""
            imageView.image = UIImage(named: imageName)
            informationLabel.attributedText = cardViewModel.attributedString
            informationLabel.textAlignment = cardViewModel.textAligment
            
            (0..<cardViewModel.imageNames.count).forEach { (_) in
                let barView = UIView()
                barView.backgroundColor = deselectedColor
                barStackView.addArrangedSubview(barView)
            }
             barStackView.arrangedSubviews.first?.backgroundColor = .white
        }
    }
    
   fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c").withRenderingMode(.alwaysOriginal))
    fileprivate let gradianteLayer = CAGradientLayer()
   fileprivate let informationLabel = UILabel()
    //configuration
     fileprivate let threshold: CGFloat = 100

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
        
    }
    
    var imageIndex = 0
    fileprivate let deselectedColor =  UIColor(white: 0, alpha: 0.1)
    @objc fileprivate func handleTap(gesture: UITapGestureRecognizer) {
        print("Tappeddddddd")
        print("featured branch")
        print("Seconded feture")
        let tapLocation = gesture.location(in: nil)
        let shouldAdvanceNextPhoto = tapLocation.x > frame.width / 2 ? true : false
        if shouldAdvanceNextPhoto {
            imageIndex = min(imageIndex + 1, cardViewModel.imageNames.count - 1)
        } else {
            imageIndex = max(0,imageIndex - 1)
        }
        let imageName = cardViewModel.imageNames[imageIndex]
        imageView.image = UIImage(named: imageName)
        barStackView.arrangedSubviews.forEach { (v) in
            v.backgroundColor = deselectedColor
        }
        barStackView.arrangedSubviews[imageIndex].backgroundColor = .white
    }
   

    fileprivate func setupGradianteLayer(){
        //how to draw a gradiante with swift
        gradianteLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradianteLayer.locations = [0.5,1.1]
        layer.addSublayer(gradianteLayer)
    }
    override func layoutSubviews() {
        // in here when your cardView frame would be
        gradianteLayer.frame = self.frame
    }
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            superview?.subviews.forEach({ (subview) in
                subview.layer.removeAllAnimations()
            })
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
        
    }
    
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
                let translation = gesture.translation(in: nil)

        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        
        let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                self.frame = CGRect(x: 600 * translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
                
            } else {
                 self.transform = .identity
            }
           
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard{
                self.removeFromSuperview()
            }
            
//            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
        }
    }
    fileprivate func setupLayout() {
        //custum drawing code
       
        addSubview(imageView)
        clipsToBounds = true
        layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.fillSuperview()
         setupBarsStack()
        //add graiant layer
        setupGradianteLayer()
        addSubview(informationLabel)
        informationLabel.numberOfLines = 0
        informationLabel.textColor = .white
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    fileprivate let barStackView = UIStackView()
    fileprivate func setupBarsStack() {
    addSubview(barStackView)
        barStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 4))
        barStackView.spacing = 4
        barStackView.distribution = .fillEqually
       
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
