//
//  ViewController.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/25.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import UIKit

class recipeViewController: UIViewController {
    
    var selectedID:Int = 0
    var JSONpurser = JSONPurser()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedID)
        
        let selectRecipe =  JSONpurser.JSONArray(id: selectedID)
        print(selectRecipe)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
