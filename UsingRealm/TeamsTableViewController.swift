//
//  TeamsTableViewController.swift
//  UsingRealm
//
//  Created by Fredrick Ohen on 11/20/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class TeamsTableViewController: UITableViewController, AddTeamDelegate {
    
    var teams: [Team]!
    @IBOutlet var teamsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        self.teams = [Team]()
    }
    
    func userDidAddTeam(team: Team) {
        
        teams.append(team)
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(team)
        }
     
        self.teamsTableView.reloadData()
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)

        let team = self.teams[indexPath.row]
        cell.textLabel?.text = team.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTeamSegue" {
            let addTeamVC: AddTeamViewController = segue.destination as! AddTeamViewController
            addTeamVC.delegate = self
        }
    }
 

}
