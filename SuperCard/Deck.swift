//
//  Deck.swift
//  SuperCard
//
//  Created by 郭家政 on 2017/4/30.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class Deck: NSObject {
	private var _cards: Array<Card> = []
	private let _cardValueSets = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
	private let _cardSuitSets = ["♣", "♦", "♥", "♠"]
	
	public func initDeck() -> Void {
		for value in self._cardValueSets {
			for suit in self._cardSuitSets {

				let card = Card()

				if suit == "♥" || suit == "♦" {
					card.initCard(value: value + suit, color: "red")
				} else {
					card.initCard(value: value + suit, color: "black")
				}

				card.flipToBack()
				self._cards.append(card)
			}
		}
	}

	public func getCards() -> Array<Card> {
		return self._cards
	}

	public func removeCard(at index: Int) -> Void {
		self._cards[index].removeFromSuperview()
		self._cards.remove(at: index)
	}

	public func isCardFront(at index: Int) -> Bool {
		return self._cards[index].isCardFront()
	}
}
