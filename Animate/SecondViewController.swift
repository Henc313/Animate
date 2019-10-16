//
//  SecondViewController.swift
//  Animate
//
//  Created by ♏︎ on 10/15/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
   @IBOutlet weak var backgroundImageView: UIImageView!
   @IBOutlet weak var gradientView: UIView!
   
   @IBOutlet weak var cardView: UIView!
   @IBOutlet weak var cardViewTitleLabel: UILabel!
   @IBOutlet weak var cardViewSubtitleLabel: UILabel!
   @IBOutlet weak var cardViewImageView: UIImageView!
   
   @IBOutlet weak var buttonContainerView: UIView!
   @IBOutlet weak var buttonBackgroundView: UIView!
   @IBOutlet weak var menuButton: UIButton!
   
   @IBOutlet weak var instagramButton: UIButton!
   @IBOutlet weak var emailButton: UIButton!
   @IBOutlet weak var twitterButton: UIButton!
   @IBOutlet weak var facebookButton: UIButton!
   
   @IBOutlet weak var thumbImageView: UIImageView!
   override func viewDidLoad() {
      super.viewDidLoad()
      gradientView.setGradient(firstColor: UIColor(white: 0, alpha: 0.0), secondColor: UIColor(white: 0, alpha: 0.3))
      
      setUpCardView()
      setUpButtonDrawer()
      
      cardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard)))
   }
   
   
   @objc func panCard(_ sender: UIPanGestureRecognizer) {
      guard let card = sender.view else { return }
      let point = sender.translation(in: card)
      let xFromCenter = card.center.x - view.center.x
      
      card.center = CGPoint(x: view.center.x + point.x, y: view.center.y)
      card.transform = CGAffineTransform(rotationAngle: (xFromCenter * (0.4 / view.frame.width))).translatedBy(x: 0, y: abs(xFromCenter) * (50 / view.frame.width))
      if xFromCenter > 0 {
         thumbImageView.image = #imageLiteral(resourceName: "thumbUp")
      } else {
         thumbImageView.image = #imageLiteral(resourceName: "thumbDown")
      }
      
      thumbImageView.alpha = abs(xFromCenter / view.center.x)
      
      if sender.state == .ended {
         if card.center.x < 0 {
            UIView.animate(withDuration: 0.3, animations: {
               card.center = CGPoint(x: card.center.x - (card.frame.width / 2), y: card.center.y)
               card.alpha = 0
            }) { (true) in
               self.cardView.removeFromSuperview()
            }
         } else if card.center.x > view.frame.width {
            UIView.animate(withDuration: 0.3, animations:  {
               card.center = CGPoint(x: card.center.x + (card.frame.width / 2), y: card.center.y)
               card.alpha = 0
            }) { (true) in
               self.cardView.removeFromSuperview()
            }
         } else {
            UIView.animate(withDuration: 0.2) {
               card.center = self.view.center
               card.transform = .identity
               self.thumbImageView.alpha = 0
            }
         }
      }
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
            self.buttonContainerView.transform = .identity
            self.menuButton.transform = .identity
            self.toggleSocialButtons()
            self.instagramButton.transform = CGAffineTransform(translationX: 100, y: 0)
            self.emailButton.transform = CGAffineTransform(translationX: 50, y: 0)
            self.twitterButton.transform = CGAffineTransform(translationX: -50, y: 0)
            self.facebookButton.transform = CGAffineTransform(translationX: -100, y: 0)
         })
      }
   }
   
   
   func toggleSocialButtons() {
      UIView.animate(withDuration: 0.7) {
         let alpha = CGFloat(self.emailButton.alpha == 0 ? 1 : 0)
         self.instagramButton.alpha = alpha
         self.emailButton.alpha = alpha
         self.twitterButton.alpha = alpha
         self.facebookButton.alpha = alpha
      }
   }
   
   
   func setUpCardView() {
      cardView.layer.cornerRadius = 12
      cardView.layer.masksToBounds = true
      cardView.backgroundColor = UIColor(white: 0, alpha: 0.8)
      cardViewImageView.layer.cornerRadius = 12
      cardViewImageView.layer.masksToBounds = true
      thumbImageView.alpha = 0
   }
   
   
   func setUpButtonDrawer() {
      buttonBackgroundView.layer.cornerRadius = 22
      buttonBackgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
      buttonContainerView.clipsToBounds = true
      instagramButton.alpha = 0
      emailButton.alpha = 0
      twitterButton.alpha = 0
      facebookButton.alpha = 0
   }
}
