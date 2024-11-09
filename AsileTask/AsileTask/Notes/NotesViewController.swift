//
//  NotesViewController.swift
//  AsileTask
//
//  Created by aman on 09/11/24.
//

import Foundation
import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var upgradeButton: UIButton!

    let viewModel = NotesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        
        viewModel.getData()
    }
    
    func setupButton() {
        upgradeButton.layer.cornerRadius = 24.5
        upgradeButton.clipsToBounds = true
    }
}
