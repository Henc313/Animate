//
//  CardView.swift
//  Animate
//
//  Created by ♏︎ on 10/16/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class CardView: UIView {
   
   var delegate: SwipeCardsDelegate?
   
   var dataSource : Card? {
      didSet {
         guard let image = dataSource?.image else { return }
         imageView.image = image
         subtitleLabel.text = dataSource?.title
      }
   }
   
   var cardContainer: ContainerView!
   
   //MARK:- Initializers
   override init(frame: CGRect) {
      super.init(frame: frame)
      addSubview(titleLabel)
      addSubview(subtitleLabel)
      addSubview(imageView)
      addSubview(thumbImageView)
      configureCard()
      setupCardViewConstraints()
      setupLabelConstraints()
      setupSubtitleLabelConstraints()
      setupImageViewConstraints()
      setupThumbImageViewConstraints()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   //MARK:- Views
   let titleLabel: UILabel = {
      let label           = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 44))
      label.textAlignment = .center
      label.font          = UIFont(name: "HelveticaNeue-Thin", size: 38)
      label.text          = "Like or dislike"
      return label
   }()
   
   let subtitleLabel: UILabel = {
      let subtitleLabel           = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 44))
      subtitleLabel.textAlignment = .center
      subtitleLabel.font          = UIFont(name: "HelveticaNeue-Thin", size: 14)
      return subtitleLabel
   }()
   
   let imageView: UIImageView = {
      let imageView                = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
      imageView.layer.cornerRadius = 12
      imageView.clipsToBounds      = true
      return imageView
   }()
   
   let thumbImageView: UIImageView = {
      let thumbImageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
      return thumbImageView
   }()
   
   //MARK:- Methods
   func configureCard() {
      layer.cornerRadius  = 12
      layer.masksToBounds = true
      backgroundColor     = UIColor(white: 0, alpha: 0.9)
      self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard)))
   }
   
   @objc func panCard(_ sender: UIPanGestureRecognizer) {
      
      let card = sender.view as! CardView
      let point = sender.translation(in: card)
      let xFromCenter = card.center.x - (self.frame.width / 2)
      
      card.center = CGPoint(x: (self.frame.width / 2) + point.x, y: self.frame.height / 2)
      
      card.transform = CGAffineTransform(rotationAngle: (xFromCenter * (0.4 / self.frame.width))).translatedBy(x: 0, y: abs(xFromCenter) * (50 / self.frame.width))
      if xFromCenter > 0 {
         self.thumbImageView.image = #imageLiteral(resourceName: "thumbUp")
      } else {
         self.thumbImageView.image = #imageLiteral(resourceName: "thumbDown")
      }
      
      self.thumbImageView.alpha = abs(xFromCenter / (self.frame.width / 2))
      if cardContainer.subviews.count > 1 {
         if abs(xFromCenter) < 150 {
            cardContainer.subviews[1].transform = CGAffineTransform(scaleX: 0.9 + abs(0.00075 * xFromCenter), y: 0.9 + abs(0.00075 * xFromCenter))
         }
      }
      
      if sender.state == .ended {
         if card.center.x < 0 {
            print(card.center.x)
            UIView.animate(withDuration: 0.3, animations: {
               card.center = CGPoint(x: card.center.x - (card.frame.width / 2), y: card.center.y)
               card.alpha = 0
            }) { (true) in
               self.delegate?.swipeDidEnd(on: card)
            }
         } else if card.center.x > self.bounds.width {
            print(card.center.x)
            UIView.animate(withDuration: 0.3, animations:  {
               card.center = CGPoint(x: card.center.x + (card.frame.width / 2), y: card.center.y)
               card.alpha = 0
            }) { (true) in
               self.delegate?.swipeDidEnd(on: card)
            }
         } else {
            UIView.animate(withDuration: 0.2) {
               if self.cardContainer.subviews.count > 1 {
                  self.cardContainer.subviews[1].transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
               }
               card.transform = .identity
               card.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
               self.thumbImageView.alpha = 0
            }
         }
      }
   }
}
