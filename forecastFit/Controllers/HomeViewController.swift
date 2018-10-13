//
//  HomeViewController.swift
//  forecastFit
//
//  Created by Rageeb Mahtab on 10/13/18.
//  Copyright © 2018 Rageeb Mahtab. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    
    @IBOutlet var weatherDescriptionLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ny%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
            } else if let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print(dataDictionary)
                let query = dataDictionary["query"] as! [String: Any]
                print(query)
            }
        // Do any additional setup after loading the view.
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
}
