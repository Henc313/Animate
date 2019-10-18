//
//  ContainerView.swift
//  Animate
//
//  Created by ♏︎ on 10/17/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class ContainerView: UIView, SwipeCardsDelegate {
   
   //MARK: - Properties
   var numberOfCardsToShow: Int = 0
   var cardsToBeVisible: Int = 3
   var remainingcards: Int = 0
   
   var visibleCards: [CardView] {
      return subviews as? [CardView] ?? []
   }
   var dataSource: CardViewDataSource? {
      didSet {
         reloadData()
      }
   }
   
   override init(frame: CGRect) {
      super.init(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
      backgroundColor = .clear
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func reloadData() {
      removeAllCards()
      guard let datasource = dataSource else { return }
      numberOfCardsToShow = datasource.numberOfCardsToShow()
      remainingcards = numberOfCardsToShow
      
      for i in 0..<min(numberOfCardsToShow,cardsToBeVisible) {
         addCard(card: datasource.card(at: i), at: i)
      }
   }
   
   private func removeAllCards() {
      for cardView in visibleCards {
         cardView.removeFromSuperview()
      }
   }
   
   func addCard(card: CardView, at index: Int) {
      card.delegate = self
      self.insertSubview(card, at: 0)
      remainingcards -= 1
   }
   
   func swipeDidEnd(on cardView: CardView) {
      guard let datasource = dataSource else { return }
      cardView.removeFromSuperview()
      
      if remainingcards > 0 {
         let newIndex = datasource.numberOfCardsToShow() - remainingcards
         addCard(card: datasource.card(at: newIndex), at: 2)
         for cardView in visibleCards {
            cardView.centerCardIn(self)
            cardView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            cardView.centerCardIn(cardView)
         }
      }else {
         for cardView in visibleCards {
            cardView.center = self.center
         }
      }
   }
}
