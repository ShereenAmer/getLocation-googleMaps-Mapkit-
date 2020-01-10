//
//  thirdViewController.swift
//  myTaskLogin
//
//  Created by shereen on 1/4/20.
//  Copyright © 2020 shereen. All rights reserved.
//

import UIKit

class MenuItemsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - Properties
    let menuItems = ["User Information", "MapKit Get Location" ,"Google Get Location"]
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDataSource
extension MenuItemsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let  cell =  tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MenuItemsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: true) {
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController = (topController as! UINavigationController).visibleViewController!
                    topController.performSegue(withIdentifier: "userSegue", sender: self)
                }
            }
            
        } else if indexPath.row == 1 {
            self.dismiss(animated: true) {
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController = (topController as! UINavigationController).visibleViewController!
                    topController.performSegue(withIdentifier: "mapKit", sender: self)
                }
            }
        } else if indexPath.row == 2 {
            self.dismiss(animated: true) {
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController = (topController as! UINavigationController).visibleViewController!
                    topController.performSegue(withIdentifier: "googleMaps", sender: self)
                }
            }
        }
    }
}
