//
//  ViewController.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/24.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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
    
    /////////////
    
    var JSONdata:[String : Any] = [:]
    
    var JSONpurser = JSONPurser()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       JSONdata = data
       JSONpurser.JSONReader()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

