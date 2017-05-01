//
//  ViewController.swift
//  SuperCard
//
//  Created by 郭家政 on 2017/4/30.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	let deck = Deck()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.deck.initDeck()

		for card in self.deck.getCards() {
			let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeCard))
			//		swipe.direction = UISwipeGestureRecognizerDirection.down
			card.addGestureRecognizer(swipe)
		}

		self.drawCard(card: self.deck.getCards()[0])
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func swipeCard() -> Void {
		if self.deck.getCards().count > 0 {
			if self.deck.isCardFront(at: 0) {
				self.deck.removeCard(at: 0)
				print(self.deck.getCards().count)
				if self.deck.getCards().count > 0 {
					self.drawCard(card: self.deck.getCards()[0])
				}
			}
			else {
				self.deck.getCards()[0].flipToFront()
			}
		}
	}

	func drawCard(card: Card) -> Void {
		// 取得螢幕的尺寸
		let fullScreenSize = UIScreen.main.bounds.size

		// 寬高
		let cardWdith: Double = Double(card._size.width)
		let cardHeight: Double = Double(card._size.height)

		// 位置
		let cardPositionX: Double = Double(fullScreenSize.width * 0.5) - cardWdith * 0.5
		let cardPositionY: Double = Double(fullScreenSize.height * 0.5) - cardHeight * 0.5

		// 指定 UIButton 外框
		card.frame = CGRect(x: cardPositionX,
		                    y: cardPositionY,
		                    width: cardWdith,
		                    height: cardHeight)

		// 使用者按下時有動畫效果
		card.isUserInteractionEnabled = true

		// 將卡牌加入畫面
		self.view.addSubview(card)
	}
}

