//
//  SecondViewController.swift
//  Animate
//
//  Created by ♏︎ on 10/15/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
   //MARK:- Outlets
   @IBOutlet weak var backgroundImageView: UIImageView!
   @IBOutlet weak var gradientView: UIView!
   
   @IBOutlet weak var buttonContainerView: UIView!
   @IBOutlet weak var buttonBackgroundView: UIView!
   @IBOutlet weak var menuButton: UIButton!
   
   @IBOutlet weak var instagramButton: UIButton!
   @IBOutlet weak var emailButton: UIButton!
   @IBOutlet weak var twitterButton: UIButton!
   @IBOutlet weak var facebookButton: UIButton!
   
   var cardView: CardView?
   var visibleCards = 3
   var cardsStack: [CardView]?
   
   //MARK:- View Load Methods
   override func viewDidLoad() {
      super.viewDidLoad()
      gradientView.setGradient(firstColor: UIColor(white: 0, alpha: 0.0), secondColor: UIColor(white: 0, alpha: 0.3))
      setUpButtonDrawer()
      
      cardView = CardView()
      cardView?.subtitleLabel.text = "Photo by Rob Robinson"
      view.addSubview(cardView!)
   }
   
   func configureCardPositionInView() {
      cardView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      cardView?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
   }
   
   @IBAction func toggleMenuTapped(_ sender: UIButton) {
      if buttonBackgroundView.transform.isIdentity {
         UIView.animate(withDuration: 0.7, animations: {
            self.buttonBackgroundView.transform = CGAffineTransform(scaleX: 11, y: 11)
            self.buttonContainerView.transform  = CGAffineTransform(translationX: 0, y: -65)
            self.menuButton.transform           = CGAffineTransform(rotationAngle: .pi)
            self.toggleSocialButtons()
            self.instagramButton.transform = .identity
            self.emailButton.transform     = .identity
            self.twitterButton.transform   = .identity
            self.facebookButton.transform  = .identity
            
         })
      } else {
         UIView.animate(withDuration: 0.7, animations: {
            self.buttonBackgroundView.transform = .identity
            self.buttonContainerView.transform  = .identity
            self.menuButton.transform           = .identity
            self.toggleSocialButtons()
            self.instagramButton.transform = CGAffineTransform(translationX: 100, y: 0)
            self.emailButton.transform     = CGAffineTransform(translationX: 50, y: 0)
            self.twitterButton.transform   = CGAffineTransform(translationX: -50, y: 0)
            self.facebookButton.transform  = CGAffineTransform(translationX: -100, y: 0)
         })
      }
   }
   
   
   func toggleSocialButtons() {
      UIView.animate(withDuration: 0.7) {
         let alpha = CGFloat(self.emailButton.alpha == 0 ? 1 : 0)
         self.instagramButton.alpha = alpha
         self.emailButton.alpha     = alpha
         self.twitterButton.alpha   = alpha
         self.facebookButton.alpha  = alpha
      }
   }
   
   
   func setUpButtonDrawer() {
      buttonBackgroundView.layer.cornerRadius = 22
      buttonBackgroundView.backgroundColor    = UIColor(white: 0.0, alpha: 0.5)
      buttonContainerView.clipsToBounds       = true
      
      instagramButton.alpha = 0
      emailButton.alpha     = 0
      twitterButton.alpha   = 0
      facebookButton.alpha  = 0
   }
}
