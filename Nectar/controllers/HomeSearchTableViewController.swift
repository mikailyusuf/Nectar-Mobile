//
//  HomeSearchTableViewController.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit

class HomeSearchTableViewController: UITableViewController {

    var items = [String] ()
     let CELLID = "CELLID"
    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         view.backgroundColor = .red
         self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.CELLID)
     }
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: self.CELLID, for: indexPath)
         cell.textLabel?.text = self.items[indexPath.row]
         return cell
     }

}
