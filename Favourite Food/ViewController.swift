//
//  ViewController.swift
//  Favourite Food
//
//  Created by vic on 1/11/16.
//  Copyright © 2016 augusteo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var nameLabel: UITextField!
  
  @IBAction func calculateTapped() {
    let baseURL = URL(string: Bundle.main.infoDictionary!["BaseURL"] as! String)!
    let url = baseURL.appendingPathComponent("3l2z2")
    let urlRequest = URLRequest(url: url)
    let session = URLSession(configuration: .default)
    
    let task = session.dataTask(with: urlRequest) { data, _, _ in
      guard let jsonData = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String: String] else { return }
      
      DispatchQueue.main.async {
        self.resultLabel.text = jsonData[self.nameLabel.text!]
      }
    }
    
    task.resume()
  }
}
