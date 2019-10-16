//
//  CardView.swift
//  Animate
//
//  Created by ♏︎ on 10/16/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class CardView: UIView {   
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      addSubview(label)
      configureCard()
      setupLabelViewConstraints()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   fileprivate func setupLabelViewConstraints() {
      label.translatesAutoresizingMaskIntoConstraints                                   = false
      label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
      label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive     = true
      label.widthAnchor.constraint(equalToConstant: 200).isActive = true
      label.heightAnchor.constraint(equalToConstant: 44).isActive = true
   }
   
   let label: UILabel = {
      let label = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 44))
      label.layer.borderWidth = 1.0
      label.layer.borderColor = UIColor.lightGray.cgColor
      return label
   }()
   
   
   func configureCard() {
      layer.cornerRadius = 12
      layer.masksToBounds = true
      backgroundColor = UIColor(white: 0, alpha: 0.8)
   }
   
   
   
}
