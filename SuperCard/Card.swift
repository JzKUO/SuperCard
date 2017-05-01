//
//  Card.swift
//  SuperCard
//
//  Created by 郭家政 on 2017/4/30.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class Card: UIButton {
	private var _value: String?
	private var _isFront: Bool = true
	class Size {
		var width: Int = 150
		var height: Int = 200
	}
	var _size = Size()

	public func initCard(value: String, color: String) -> Void {
		self._value = value
		self.setBackgroundImage(UIImage(named: value), for: UIControlState.normal)

//		let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.flipToFront))
//		swipe.direction = UISwipeGestureRecognizerDirection.down
//		self.addGestureRecognizer(swipe)
	}

	// 翻到正面
	public func flipToFront() -> Void {
		if !self._isFront {
			self._isFront = true
			if let value = self._value {
				self.setBackgroundImage(UIImage(named: value),
				                        for: UIControlState.normal)
			}
//			self.setTitle(self._value, for: UIControlState.normal)
		}
	}

	// 翻到背面
	public func flipToBack() -> Void {
		if self._isFront {
			self._isFront = false
			self.setBackgroundImage(UIImage(named: "cardback"),
			                        for: UIControlState.normal)
//			self.setTitle("", for: UIControlState.normal)
		}
	}

	public func isCardFront() -> Bool {
		return self._isFront
	}
}
