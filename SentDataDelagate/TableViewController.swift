//
//  TableViewController.swift
//  SentDataDelagate
//
//  Created by Admin on 11/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, MasterDelegate {
    
    var number = Array(1...5)
    @IBOutlet var nodataView: UIView!
    
    @IBOutlet weak var footView: UIView!
    var check : Bool = false {
        didSet {
            tableView.tableFooterView = check ? nodataView : footView
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // co the co hoac khong!
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                check = number.count == 0
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return number.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(number[indexPath.row])
        // Configure the cell...

        return cell
    }
    

    func sentData(data: String) {
        let num = Int(data) ?? 0
        if let indexPath = tableView.indexPathForSelectedRow {
            number[indexPath.row] = num
            tableView.reloadRows(at:[indexPath], with: .automatic)
        } else {
            number.append(num)
        }
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            number.remove(at: indexPath.row)
            if number.count == 0 {
                check = true
            }else {
                check = false
            }
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let numberData = segue.destination as? ViewController
        numberData?.delegate = self
    }
    

}
