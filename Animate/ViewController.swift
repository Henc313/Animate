//
//  ViewController.swift
//  Animate
//
//  Created by ♏︎ on 10/15/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var backgroundImage: UIImageView!
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var subtitleLabel: UILabel!
   @IBOutlet weak var searchButton: UIButton!
   @IBOutlet weak var gradientView: UIView!
   @IBOutlet weak var buttonTitleLabel: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpInitialView()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(true, animated: false)
   }
   
   override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
      navigationController?.setNavigationBarHidden(false, animated: true)
   }
   
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      //      UIView.animate(withDuration: 1, animations: {
      //         self.backgroundImage.alpha = 1
      //      }) { (true) in
      //         UIView.animate(withDuration: 1, animations: {
      //            self.titleLabel.alpha = 1
      //         }) { (true) in
      //            self.showTitle()
      //         }
      //      }
   }
   
   
   func showTitle() {
      UIView.animate(withDuration: 1, animations: {
         self.titleLabel.alpha = 1
      }) { (true) in
         self.showDescription()
      }
   }
   
   
   func showDescription() {
      UIView.animate(withDuration: 1, animations: {
         self.subtitleLabel.alpha = 1
      }) { (true) in
         self.showButtonAndText()
      }
   }
   
   
   func showButtonAndText() {
      UIView.animate(withDuration: 1) {
         self.searchButton.alpha = 1
         self.buttonTitleLabel.alpha = 1
      }
   }
   
   
   func setUpInitialView() {
      backgroundImage.alpha  = 1
      titleLabel.alpha       = 1
      subtitleLabel.alpha    = 1
      searchButton.alpha     = 1
      buttonTitleLabel.alpha = 1
      gradientView.setGradient(firstColor: UIColor(white: 0, alpha: 0.0), secondColor: UIColor(white: 0, alpha: 0.3))
   }
   
   
}



extension UIView {
   
   func setGradient(firstColor: UIColor, secondColor: UIColor) {
      let gradientLayer        = CAGradientLayer()
      gradientLayer.frame      = bounds
      gradientLayer.colors     = [firstColor.cgColor, secondColor.cgColor]
      gradientLayer.locations  = [0.0, 0.7]
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
      gradientLayer.endPoint   = CGPoint(x: 0.0, y: 1.0)
      
      layer.insertSublayer(gradientLayer, at: 0)
   }
}
