//
//  CollectionViewController.swift
//  Rarest Gemstones
//
//  Created by Mirko Cukich on 10/20/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift Rarest Gemstones Collection Views Image Gallery Demo - Demo 25 of 30

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var items = [[String:String]]()
    
    
    func loadRareGemPlist() -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "RareGems", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.items = loadRareGemPlist()
        
        self.navigationItem.title = "Rarest Gemstones"
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            let detail = segue.destination as! DetailViewController
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let item = self.items[indexPath.row]
                
                detail.sentData1 = item["Name"]
                detail.sentData2 = item["Image"]
                detail.sentData3 = item["Info"]
                detail.sentData4 = item["Description"]
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        
        let item = self.items[indexPath.row]
        
        cell.cellImageView.image = UIImage(named: item["Image"]!)
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize : CGRect = UIScreen.main.bounds
        var widthCell = 0
        var heightCell = 0
        // iPhone width info ref.: https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions
        // Demo setup for iPhones not iPads
        // iPhone 11 Pro Max, Xs Max, 11,Xr, 6+,6s+,7+,8+ screen widths
        if screenSize.width == 414 {
            
            widthCell = 190
            heightCell = 125
        }
       
        // iPhone 11 Pro, X, Xs, 6, 6s, 7,8 screen widths
        if screenSize.width == 375 {
                   
                   widthCell = 172
                   heightCell = 125
               }
        
        // iPhone 5, 5s, 5c, SE, 4, 4s, 2G, 3G, 3GS screen widths
        if screenSize.width == 320 {
                   
                   widthCell = 145
                   heightCell = 125
               }
        
        return CGSize(width: widthCell, height: heightCell)
    }

}
