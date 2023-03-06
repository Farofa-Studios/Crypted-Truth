//
//  GeniusViewController.swift
//  CryptedTruth
//
//  Created by Alex A. Rocha on 03/03/23.
//

import Foundation
import UIKit
import SwiftUI

class GeniusViewController: UIViewController {
    
    var viewModel: GeniusViewModel
    var geniusView: UIHostingController<GeniusView>

    init() {
        viewModel = GeniusViewModel()
        geniusView = UIHostingController(rootView: GeniusView(viewModel: viewModel))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
            
        addChild(geniusView)
        view.addSubview(geniusView.view)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        geniusView.view.translatesAutoresizingMaskIntoConstraints = false
        geniusView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        geniusView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        geniusView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        geniusView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        if viewModel.isPlayerTurn && !viewModel.isGameOver && !viewModel.didConcludeGame {
            viewModel.playerInputDirection = sender.direction
        }
    }
    
}
