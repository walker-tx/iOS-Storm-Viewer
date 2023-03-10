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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(shareTapped)
        )
        
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
    
    @objc func shareTapped() {
        guard let image = self.imageView?.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found!")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem =
            navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
