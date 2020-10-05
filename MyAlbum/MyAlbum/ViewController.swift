//
//  ViewController.swift
//  MyAlbum
//
//  Created by 문효재 on 2020/10/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func hello(_ sender: Any) {
        let alert = UIAlertController(title: "hello", message: "My Frisrt App!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func 도전과제(_ sender: Any) {
        let alert = UIAlertController(title: "도전과제", message: "도전과제", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

