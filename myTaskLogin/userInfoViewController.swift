//
//  userInfoViewController.swift
//  myTaskLogin
//
//  Created by shereen on 1/4/20.
//  Copyright © 2020 shereen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class userInfoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Private Functions
extension userInfoViewController {
    private func displayData(){
        let currentUser = Auth.auth().currentUser
        userName.text = currentUser?.displayName
        userEmail.text = currentUser?.email
    }
}
