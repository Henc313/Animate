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
   
   @IBOutlet weak var buttonContainerView: UIView!
   @IBOutlet weak var buttonBackgroundView: UIView!
   @IBOutlet weak var menuButton: UIButton!
   
   @IBOutlet weak var instagramButton: UIButton!
   @IBOutlet weak var emailButton: UIButton!
   @IBOutlet weak var twitterButton: UIButton!
   @IBOutlet weak var facebookButton: UIButton!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      gradientView.setGradient(firstColor: UIColor(white: 0, alpha: 0.0), secondColor: UIColor(white: 0, alpha: 0.3))
      setUpButtonDrawer()
      cardView.subtitleLabel.text = "Photo by Rob Robinson"
      view.addSubview(cardView)
      setupCardViewConstraints()
      cardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard)))
   }
   
   let cardView: CardView = {
      let view = CardView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
      view.layer.borderWidth = 4.0
      view.layer.borderColor = UIColor.lightGray.cgColor
      return view
   }()
   
   fileprivate func setupCardViewConstraints() {
      cardView.translatesAutoresizingMaskIntoConstraints                      = false
      cardView.heightAnchor.constraint(equalToConstant: 460).isActive         = true
      cardView.widthAnchor.constraint(equalToConstant: 330).isActive          = true
      cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
   }
   
   
   @objc func panCard(_ sender: UIPanGestureRecognizer) {
      guard let card = sender.view else { return }
      let point = sender.translation(in: card)
      let xFromCenter = card.center.x - view.center.x

      card.center = CGPoint(x: view.center.x + point.x, y: view.center.y)

      card.transform = CGAffineTransform(rotationAngle: (xFromCenter * (0.4 / view.frame.width))).translatedBy(x: 0, y: abs(xFromCenter) * (50 / view.frame.width))
      if xFromCenter > 0 {
         cardView.thumbImageView.image = #imageLiteral(resourceName: "thumbUp")
      } else {
         cardView.thumbImageView.image = #imageLiteral(resourceName: "thumbDown")
      }

      cardView.thumbImageView.alpha = abs(xFromCenter / view.center.x)

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
               self.cardView.thumbImageView.alpha = 0
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
