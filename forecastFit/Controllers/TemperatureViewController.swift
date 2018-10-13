//
//  TemperatureViewController.swift
//  forecastFit
//
//  Created by Lu Meng on 10/13/18.
//  Copyright © 2018 Rageeb Mahtab. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapButton(_ sender: Any) {
        let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController")
        self.view.window?.rootViewController = tabBarController
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
