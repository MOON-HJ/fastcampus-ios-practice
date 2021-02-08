//
//  ViewController.swift
//  FirebaseTest
//
//  Created by 문효재 on 2021/01/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    
    let db  = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      updateLabel()
    
    }
    
    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? String ?? ""
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        })
        
    }


}

