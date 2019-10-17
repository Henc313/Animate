//
//  SecondViewController.swift
//  Animate
//
//  Created by ♏︎ on 10/15/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//





//TODO: - Create a ContainerView to contain the card stack. Add new cards on top of that view (insertAbove)
// Use containerView.subview.count to add new cards to the stack

import UIKit

class SecondViewController: UIViewController, SwipeCardsDelegate {
   
   var cardCount = 1
   
   func swipeDidEnd(on cardView: CardView) {
      cardView.removeFromSuperview()
      for _ in 1...visibleCards {
         let newCard = CardView()
         addCard(card: newCard)
      }
   }
   
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
   
   var visibleCards = 3
   
   //MARK:- View Load Methods
   override func viewDidLoad() {
      super.viewDidLoad()
      
      gradientView.setGradient(firstColor: UIColor(white: 0, alpha: 0.0), secondColor: UIColor(white: 0, alpha: 0.3))
      setUpButtonDrawer()
      
      let initialCard = CardView()
      initialCard.delegate = self
      view.addSubview(initialCard)
      initialCard.configureCard()
      initialCard.centerCardIn(view)
   }
   
   func addCard(card: CardView) {
      if cardCount < cards.count {
         card.delegate = self
         view.insertSubview(card, aboveSubview: gradientView)
         card.configureCard()
         card.centerCardIn(view)
         card.imageView.image = cards[cardCount].image
         card.subtitleLabel.text = cards[cardCount].title
         cardCount += 1
      } else {
         card.delegate = self
         view.addSubview(card)
         card.configureCard()
         card.centerCardIn(view)
         card.titleLabel.text = "THAT'S IT"
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
