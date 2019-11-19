//
//  CustomTabBarController.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let co_tabBarBackground: UIColor = .white
    let co_tabBarTint: UIColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
    var nav_search: UINavigationController!
    
    var searchController: SearchView! = SearchView()
    var saveController: SaveView! = SaveView()
    var profileController: ProfileView! = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.layer.shadowRadius = 6
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5.0)
        self.tabBar.layer.shadowColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0).cgColor
        self.tabBar.layer.shadowOpacity = 0.75
        self.tabBar.clipsToBounds = false
        self.tabBar.layer.masksToBounds = false
        
/*********************     CUSTOMIZE TAB BAR APPEARANCE    ********************/
        view.isOpaque = true
        self.tabBar.barTintColor = co_tabBarBackground
        self.tabBar.tintColor = co_tabBarTint
        self.tabBar.isTranslucent = false
        self.tabBar.shadowImage = UIImage()

/*********************     SEARCH VIEW CONTROLLER    ********************/
        searchController.title = ""
        searchController.tabBarItem.image = UIImage(named: "search")

/*********************     SAVE VIEW CONTROLLER    ********************/
        saveController.title = ""
        saveController.tabBarItem.image = UIImage(named: "save")

/*********************     PROFILE VIEW CONTROLLER    ********************/
        profileController.title = ""
        profileController.tabBarItem.image = UIImage(named: "profile")

/*********************     Set ViewControllers for TabBarController    ********************/
        viewControllers = [searchController, saveController, profileController]
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
