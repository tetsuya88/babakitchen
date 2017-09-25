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
    
    let sample:[String] = ["斉藤さん","吉田さん","加藤さん","後藤さん","三井さん","多賀禰さん"]
    
    /////////////
    
    private var getData:[String]?
    
    private var JSONdata:[String : Any] = [:]
    
    private var JSONpurser = JSONPurser()
    private var selectID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        JSONpurser.JSONReader()
        JSONdata = data
        getData = sample
        print(getData!)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let cellCount = (getData?.count)!
        print(cellCount)
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let faceCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "faceCell", for: indexPath)
        
        let faceCellLabel = faceCell.contentView.viewWithTag(1) as! UILabel
        
        faceCellLabel.text = getData?[(indexPath as NSIndexPath).row]
        
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
    
}

