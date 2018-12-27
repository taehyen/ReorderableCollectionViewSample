//
//  ViewController.swift
//  ReorderableCollectionViewApp
//
//  Created by innergraph on 27/12/2018.
//  Copyright © 2018 taehyen. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
	
	private var items: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		
		readyForData()
		
		readyForViewLayout()

		readyForGesture()
		
		collectionView.backgroundColor = UIColor.gray
	}
	
	private func readyForData() {
		for value in 0..<6 {
			items.append("\(value)")
		}
	}
	
	private func readyForViewLayout() {
		let colCount: CGFloat = 3.0
		let width = collectionView.frame.size.width - ((colCount-1) * 1)
		let cellSize = CGFloat(width / colCount)
		
		let collectionViewLayout = UICollectionViewFlowLayout()
		collectionViewLayout.itemSize = CGSize(width: cellSize, height: cellSize)
		collectionViewLayout.minimumLineSpacing = 1.0
		collectionViewLayout.minimumInteritemSpacing = 1.0
		collectionView.collectionViewLayout = collectionViewLayout
	}
	
	private func readyForGesture() {
		let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(_:)))
		collectionView.addGestureRecognizer(longPressGesture)
	}
	
	@objc func handleLongGesture(_ gesture: UILongPressGestureRecognizer) {
		switch gesture.state {
		case .began:
			guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
				break
			}
			collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
		case .changed:
			collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
		case .ended:
			collectionView.endInteractiveMovement()
		default:
			collectionView.cancelInteractiveMovement()
		}
	}
	
	//data source
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		cell.title = items[indexPath.row]
		return cell
	}
	
	//cell movement
	override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let sourceItem = items[sourceIndexPath.row]
		items[sourceIndexPath.row] = items[destinationIndexPath.row]
		items[destinationIndexPath.row] = sourceItem
	}
}
