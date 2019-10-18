//
//  Cards.swift
//  Animate
//
//  Created by ♏︎ on 10/17/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import Foundation
import UIKit

protocol CardViewDataSource {
   func numberOfCardsToShow() -> Int
   func card(at index: Int) -> CardView
   func emptyView() -> UIView?
}

protocol SwipeCardsDelegate {
   func swipeDidEnd(on cardView: CardView)
}

struct Card {
   var title = ""
   var image: UIImage
   
   init(title: String, image: UIImage) {
      self.title = title
      self.image = image
   }
}

var cards = [Card(title: "Photo by Max Bender on Unsplash", image: UIImage(named: "city0")!),
             Card(title: "Photo by ben o'bro on Unsplash", image: UIImage(named: "city1")!),
             Card(title: "Photo by jonathan riley on Unsplash", image: UIImage(named: "city2")!),
             Card(title: "Photo by Yeshi Kangrang on Unsplash", image: UIImage(named: "city3")!),
             Card(title: "Photo by Oskars Sylwan on Unsplash", image: UIImage(named: "city4")!),
             Card(title: "Photo by JC Gellidon on Unsplash", image: UIImage(named: "city5")!),
             Card(title: "Photo by Pawel Nolbert on Unsplash", image: UIImage(named: "city6")!),
             Card(title: "Photo by Andrea Cau on Unsplash", image: UIImage(named: "city7")!),
             Card(title: "Photo by Matthew Henry on Unsplash", image: UIImage(named: "city8")!),
             Card(title: "Photo by Andreas Brücker on Unsplash", image: UIImage(named: "city9")!),
             Card(title: "Photo by Alex Knight on Unsplash", image: UIImage(named: "city10")!),
             Card(title: "Photo by Dawson Lovell on Unsplash", image: UIImage(named: "city11")!),
             Card(title: "Photo by mwangi gatheca on Unsplash", image: UIImage(named: "city12")!),
             Card(title: "Photo by Jonathan Roger on Unsplash", image: UIImage(named: "city13")!),
             Card(title: "Photo by Thomas Habr on Unsplash", image: UIImage(named: "city14")!),
             Card(title: "Photo by Erol Ahmed on Unsplash", image: UIImage(named: "city15")!),
             Card(title: "Photo by Astemir Almov on Unsplash", image: UIImage(named: "city16")!),
             Card(title: "Photo by Pedro Lastra on Unsplash", image: UIImage(named: "city17")!),
             Card(title: "Photo by All Bong on Unsplash", image: UIImage(named: "city18")!),
             Card(title: "Photo by Max Bender on Unsplash", image: UIImage(named: "city19")!)
]
