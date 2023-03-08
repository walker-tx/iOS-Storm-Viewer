//
//  DetailViewController.swift
//  HWS Project 1
//
//  Created by Walker Lockard on 3/7/23.
//

import UIKit

class StormDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedStormImage: Picture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedStormImage?.label
        self.navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = self.selectedStormImage {
            imageView.image = UIImage(named: imageToLoad.path)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnTap = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.hidesBarsOnTap = false
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
