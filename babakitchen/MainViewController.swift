//
//  ViewController.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/24.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate {
    
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
    
    var JSONpurser = JSONPurser()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        JSONpurser.JSONReader()
        JSONdata = data
        
        getData = sample

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

