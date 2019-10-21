//
//  DetailViewController.swift
//  Rarest Gemstones
//
//  Created by Mirko Cukich on 10/20/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift Rarest Gemstones Collection Views Image Gallery Demo - Demo 25 of 30


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    
    var sentData1: String!
    var sentData2: String!
    var sentData3: String!
    var sentData4: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = sentData1
        
        detailImageView.image = UIImage(named: sentData2)
        nameLabel.text = sentData1
        infoLabel.text = sentData3
        detailDescription.text = sentData4
        
       
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
