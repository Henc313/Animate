//
//  CardView.swift
//  Animate
//
//  Created by ♏︎ on 10/16/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class CardView: UIView {
   
   let mainView = UIScreen.main.bounds
   
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
   
   //MARK:- Constraints
   fileprivate func setupCardViewConstraints() {
      self.translatesAutoresizingMaskIntoConstraints                      = false
      self.heightAnchor.constraint(equalToConstant: 460).isActive         = true
      self.widthAnchor.constraint(equalToConstant: 330).isActive          = true
   }
   
   fileprivate func setupLabelConstraints() {
      titleLabel.translatesAutoresizingMaskIntoConstraints                                   = false
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive        = true
      titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive                       = true
      titleLabel.heightAnchor.constraint(equalToConstant: 64).isActive                       = true
   }
   
   fileprivate func setupSubtitleLabelConstraints() {
      subtitleLabel.translatesAutoresizingMaskIntoConstraints                                     = false
      subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive   = true
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
      subtitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive                         = true
      subtitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive                         = true
   }
   
   fileprivate func setupImageViewConstraints() {
      imageView.translatesAutoresizingMaskIntoConstraints                                        = false
      imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
      imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive           = true
      imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive        = true
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive      = true
      imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive      = true
      
   }
   
   fileprivate func setupThumbImageViewConstraints() {
      thumbImageView.translatesAutoresizingMaskIntoConstraints                                        = false
      thumbImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive      = true
      thumbImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
      thumbImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
      thumbImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
   }
   
   //MARK:- Views
   let titleLabel: UILabel = {
      let label               = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 44))
      label.layer.borderWidth = 1.0
      label.layer.borderColor = UIColor.lightGray.cgColor
      label.textAlignment     = .center
      label.font              = UIFont(name: "HelveticaNeue-Thin", size: 42)
      label.text              = "Like or dislike"
      return label
   }()
   
   let subtitleLabel: UILabel = {
      let subtitleLabel               = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 44))
      subtitleLabel.layer.borderWidth = 1.0
      subtitleLabel.layer.borderColor = UIColor.lightGray.cgColor
      subtitleLabel.textAlignment     = .center
      subtitleLabel.font              = UIFont(name: "HelveticaNeue-Thin", size: 14)
      return subtitleLabel
   }()
   
   let imageView: UIImageView = {
      let imageView                = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
      imageView.layer.borderWidth  = 1.0
      imageView.layer.borderColor  = UIColor.lightGray.cgColor
      imageView.layer.cornerRadius = 12
      return imageView
   }()
   
   let thumbImageView: UIImageView = {
      let thumbImageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
      thumbImageView.layer.borderWidth = 1.0
      thumbImageView.layer.borderColor = UIColor.lightGray.cgColor
      return thumbImageView
   }()
   
   //MARK:- Methods
   func configureCard() {
      layer.cornerRadius  = 12
      layer.masksToBounds = true
      backgroundColor     = UIColor(white: 0, alpha: 0.8)
      self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard)))
   }
   
   @objc func panCard(_ sender: UIPanGestureRecognizer) {
      guard let card = sender.view else { return }
      let point = sender.translation(in: card)
      let xFromCenter = card.center.x - UIScreen.main.bounds.midX
      
      card.center = CGPoint(x: UIScreen.main.bounds.midX + point.x, y: UIScreen.main.bounds.midY)
      
      card.transform = CGAffineTransform(rotationAngle: (xFromCenter * (0.4 / UIScreen.main.bounds.width))).translatedBy(x: 0, y: abs(xFromCenter) * (50 / UIScreen.main.bounds.width))
      if xFromCenter > 0 {
         self.thumbImageView.image = #imageLiteral(resourceName: "thumbUp")
      } else {
         self.thumbImageView.image = #imageLiteral(resourceName: "thumbDown")
      }
      
      self.thumbImageView.alpha = abs(xFromCenter / UIScreen.main.bounds.midX)
      
      if sender.state == .ended {
         if card.center.x < 0 {
            UIView.animate(withDuration: 0.3, animations: {
               card.center = CGPoint(x: card.center.x - (card.frame.width / 2), y: card.center.y)
               card.alpha = 0
            }) { (true) in
               self.removeFromSuperview()
            }
         } else if card.center.x > self.frame.width {
            UIView.animate(withDuration: 0.3, animations:  {
               card.center = CGPoint(x: card.center.x + (card.frame.width / 2), y: card.center.y)
               card.alpha = 0
            }) { (true) in
               self.removeFromSuperview()
            }
         } else {
            UIView.animate(withDuration: 0.2) {
               card.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
               card.transform = .identity
               self.thumbImageView.alpha = 0
            }
         }
      }
   }
   
   
}
