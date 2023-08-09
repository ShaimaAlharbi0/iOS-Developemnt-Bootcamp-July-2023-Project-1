//
//  ViewController.swift
//  Class1
//
//  Created by Shaima Alharbi on 20/01/1445 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel?.text = "Hello Shaima"
    }
    
}
