//
//  ListVC.swift
//  Weather Gift
//
//  Created by Amanda Gilmour on 3/14/17.
//  Copyright © 2017 Amanda Gilmour. All rights reserved.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var locationsArray = [String]()
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self 
        tableView.reloadData()
    }

}
extension ListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        cell.textLabel?.text = locationsArray[indexPath.row]
        return cell 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentPage = indexPath.row
        print("Hey I've been clicked at indexpath.row \(indexPath.row)")
    }
}
