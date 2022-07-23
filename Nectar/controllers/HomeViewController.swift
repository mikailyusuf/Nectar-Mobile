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

        let vc1 = ShopViewController()
        let vc2 = ExploreViewController()
        let vc3 = CartViewController()
        let vc4 = FavouriteViewController()
        let vc5 = AccountViewController()
   
        
        vc1.title = "Shop"
        vc2.title = "Explore"
        vc3.title = "Cart"
        vc4.title = "Favourite"
        vc5.title = "Account"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        nav1.tabBarItem = UITabBarItem(title:"Shop", image:UIImage(named:"shop_icon"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title:"Explore", image:UIImage(named: "search_icon"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title:"Cart", image:UIImage(named: "cart_icon"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title:"Favourite", image:UIImage(named: "favourite"), tag: 3)
        nav5.tabBarItem = UITabBarItem(title:"Account", image:UIImage(named: "account_icon"), tag: 3)
        
        
        setViewControllers([nav1,nav2,nav3,nav4,nav5], animated: true)
    
    }
    

   

}