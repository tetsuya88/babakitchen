//
//  JSONPurser.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/25.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import Foundation
import SwiftyJSON


class JSONPurser{
    
    func JSONReader() -> String {
        //jsonファイルの読みこみ
        let jsonPath = Bundle.main.path(forResource: "sample", ofType: "json")
        
        do {
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath!))
            let json = JSON(data: jsonData!)
            let faceimageURL: String = json["data"][1]["faceimageURL"].string!
            
            //print(name)
            return faceimageURL
            
        } catch {
            print("error")
            return ""
        }
    }
    
    func JSONArray() -> Array<Any> {
        
        let jsonPath = Bundle.main.path(forResource: "sample", ofType: "json")
        
        do {
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath!))
            let json = JSON(data: jsonData!)

            //let recipe = jsonData?[0].double
            let recipe: Array = json["data"][2]["recipe"].array!
            
            print(recipe)
            return recipe
            
        } catch {
            print("error")
            //return ""
        }

        
    }
}
