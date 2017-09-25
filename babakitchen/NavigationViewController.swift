//
//  NavigationViewController.swift
//  babakitchen
//
//  Created by menteadmin on 2017/09/25.
//  Copyright © 2017年 tetsuya yamaura. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // 戻るボタンの色を変更
        self.navigationBar.tintColor = UIColor.white
        //self.navigationBar.topItem!.titleView = UIImageView(image: UIImage(named: "top.png"))
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController,animated: Bool) {
        let backButton: UIBarButtonItem = UIBarButtonItem()
        // 戻るボタンの文字を空文字にする
        backButton.title = ""
        viewController.navigationItem.backBarButtonItem = backButton

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
