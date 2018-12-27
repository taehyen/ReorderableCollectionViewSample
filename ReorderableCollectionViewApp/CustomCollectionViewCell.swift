//
//  CustomCollectionViewCell.swift
//  ReorderableCollectionViewApp
//
//  Created by innergraph on 27/12/2018.
//  Copyright © 2018 taehyen. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var textLabel: UILabel!
	
	var title: String? {
		didSet {
			textLabel.text = title ?? ""
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		cellInitialization()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		cellInitialization()
	}
	
	private func cellInitialization() {

	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		backgroundColor = .white
		contentView.layer.borderColor = UIColor.black.cgColor
		contentView.layer.borderWidth = 1.0
	}
}
