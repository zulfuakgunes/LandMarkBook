//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Zülfü Akgüneş on 28.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    var chosenName = ""
    var chosenImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landMarkNames = ["Lille" , "Roma" , "Viyana"]
        
        landMarkImages.append(UIImage(named: "lille")!)
        landMarkImages.append(UIImage(named: "roma")!)
        landMarkImages.append(UIImage(named: "viyana")!)
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
//        content.image = landMarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = landMarkNames[indexPath.row]
        chosenImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandMarkName = chosenName
            destinationVC.selectedLandMarkImage = chosenImage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:  .automatic)
        }
    }

}

