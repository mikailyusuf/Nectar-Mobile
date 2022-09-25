//
//  HomeViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        
        
        let vc1 = ShopViewController()
        let vc2 = ExploreViewController()
        let vc3 =   OrdersViewController()
        let vc4 = FavouriteViewController()
        let vc5 = AccountViewController()
   

        vc2.title = "Explore"
        vc3.title = "Orders"
        vc4.title = "Favourite"
        vc5.title = "Account"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
   
        nav1.tabBarItem = UITabBarItem(title:"Shop", image:UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title:"Explore", image:UIImage(systemName: "magnifyingglass"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title:"Orders", image:UIImage(systemName: "cart"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title:"Favourite", image:UIImage(systemName: "suit.heart"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title:"Account", image:UIImage(systemName: "person"), tag: 5)
        
        
        self.navigationController?.tabBarItem.imageInsets = UIEdgeInsets(top: 5,left: 0,bottom: -5,right: 0)
        setViewControllers([nav1,nav2,nav3,nav4,nav5], animated: true)
    
    }
    

   

}
