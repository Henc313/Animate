//
//  CardViewConstraints.swift
//  Animate
//
//  Created by ♏︎ on 10/18/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import Foundation
import UIKit

extension CardView {
   
   func centerCardIn(_ view: UIView) {
      self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
   }
   
   func setupCardViewConstraints() {
      self.translatesAutoresizingMaskIntoConstraints              = false
      self.heightAnchor.constraint(equalToConstant: 460).isActive = true
      self.widthAnchor.constraint(equalToConstant: 330).isActive  = true
   }
   
   func setupLabelConstraints() {
      titleLabel.translatesAutoresizingMaskIntoConstraints                                   = false
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive        = true
      titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive                       = true
      titleLabel.heightAnchor.constraint(equalToConstant: 64).isActive                       = true
   }
   
   func setupSubtitleLabelConstraints() {
      subtitleLabel.translatesAutoresizingMaskIntoConstraints                                     = false
      subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive   = true
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
      subtitleLabel.widthAnchor.constraint(equalToConstant: 280).isActive                         = true
      subtitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive                         = true
   }
   
   func setupImageViewConstraints() {
      imageView.translatesAutoresizingMaskIntoConstraints                                        = false
      imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
      imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive           = true
      imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive        = true
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive      = true
      imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive      = true
      
   }
   
   func setupThumbImageViewConstraints() {
      thumbImageView.translatesAutoresizingMaskIntoConstraints                                        = false
      thumbImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive      = true
      thumbImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
      thumbImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
      thumbImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
   }
}
