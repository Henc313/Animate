//
//  CardView.swift
//  Animate
//
//  Created by ♏︎ on 10/16/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class CardView: UIView {
   
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var subtitleLabel: UILabel!
   @IBOutlet weak var imageView: UIImageView!
   @IBOutlet weak var thumbsImageView: UIImageView!
   
   
   func configurePosition() {
      centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
      centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
      widthAnchor.constraint(equalToConstant: 330).isActive = true
      heightAnchor.constraint(equalToConstant: 460).isActive = true
   }
   
   
   func configureCard() {
      layer.cornerRadius = 12
      layer.masksToBounds = true
      backgroundColor = UIColor(white: 0, alpha: 0.8)
      imageView.image = #imageLiteral(resourceName: "city2")
      imageView.layer.cornerRadius = 12
      imageView.layer.masksToBounds = true
      thumbsImageView.alpha = 0
   }
   
   
   
}
