//
//  JSONPurser.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/25.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import Foundation

class JSONPurser{

    func JSONReader(){
    
        
        //jsonファイルの読みこみ
        var jsonPath = Bundle.main.path(forResource: "sample", ofType: "json")
        //jsonPath = jsonPath?.data(using: String.Encoding.utf8)!
        
        
        
            do{
                let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath!))
                
                jsonData
                
                
                let jsonArray = (try! JSONSerialization.jsonObject(with: jsonData!, options: [])) as! NSDictionary
                
                
            
            print(jsonArray)
            
            
        } catch{
            print("error")
        }
        
        
        
           }
}
