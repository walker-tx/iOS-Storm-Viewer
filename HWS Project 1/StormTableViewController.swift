//
//  ViewController.swift
//  HWS Project 1
//
//  Created by Walker Lockard on 3/7/23.
//

import UIKit

struct Picture {
    let path: String
    let label: String
    
    init(path: String, label: String) {
        self.path = path
        self.label = label
    }
}

class StormTableViewController: UITableViewController {
    var pictures = [Picture]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Storm Pictures ⛈️"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManager = FileManager.default
        /// "A bundle is a directory containing our compiled program and all our assets."
        /// We use BANGs here because we _want_ this code to fail catastrophically.
        let path = Bundle.main.resourcePath!
        let files = try! fileManager.contentsOfDirectory(atPath: path)
        let onlyImages = files.filter({ $0.hasPrefix("nssl") }).sorted()
        
        for (idx, img) in onlyImages.enumerated() {
            let pic = Picture(path: img, label: "Picture \(idx+1) of \(onlyImages.count)")
            pictures.append(pic)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }

    /// Gets a cell recycled cell (dequeuing) and stuffs new data in it  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = self.pictures[indexPath.row].label
        cell.detailTextLabel?.text = self.pictures[indexPath.row].path
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "StormDetail") as? StormDetailViewController {
            viewController.selectedStormImage = pictures[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

