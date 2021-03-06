//
//  ViewController.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/24.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    ///////仮データ///////
    let data:[String : Any] = [
        "name":"saitou",
        "faceimageURL":"https://www.eeee.jp",
        "recipe":[
            "title":"目玉焼き",
            "imageURl":"https://aaaaaawwwww",
            "materials":["油","卵","醤油"],
            "flow":["油を引く","火にかける","卵を落とす","完成"]
        ]
    ]
    
    let sample:[String] = ["斉藤さん","吉田さん","加藤さん","後藤さん","三井さん","多賀禰さん","友野さん","佐々木さん","持田さん"]
    let favoriteSample:[Int] = [0,3,4,6]
    /////////////
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var getData:[String] = []
    
    private var JSONdata:[String : Any] = [:]
    
    private var JSONpurser = JSONPurser()
    private var selectID = 0
    
    private var favoriteID:[Int]?
    private var favoriteState:Bool = false
    private var originData:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0...6{
            var faceimageURL = JSONpurser.JSONReader(id:i)
            print(faceimageURL)
            getData.append(faceimageURL)
        }
        print(getData)
        favoriteID = favoriteSample
        originData = getData
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let cellCount = getData.count
        print(cellCount)
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let faceCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "faceCell", for: indexPath)
        
        let faceCellView = faceCell.contentView.viewWithTag(1) as! UIImageView
        
        let cellImage = UIImage(named: "\(getData[(indexPath as NSIndexPath).row]).png")
        
        faceCellView.image = cellImage
        
        return faceCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectID = indexPath.row
        performSegue(withIdentifier: "showRecipeView", sender: nil)
    }
    
    
    //レイアウト調整
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2-2
        return CGSize(width: cellSize, height: cellSize)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeView"{
            let recipeView:recipeViewController = segue.destination as! recipeViewController
            recipeView.selectedID = selectID
        }
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        
        if favoriteState == false{
            
            let favoriteAmount = (favoriteID?.count)!
            print(favoriteAmount)
            getData = []
            
            for i in 1...favoriteAmount {
                let favoriteKey = (favoriteID?[i-1])!
                let recipeName = originData[favoriteKey]
                getData.append(recipeName)
            }
            collectionView.reloadData()
            self.view.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
            favoriteState = true
        }else{
            getData = originData
            collectionView.reloadData()
            self.view.backgroundColor = UIColor(red: 255, green: 253, blue: 242, alpha: 100)
            favoriteState = false
        }
        
    }
}

