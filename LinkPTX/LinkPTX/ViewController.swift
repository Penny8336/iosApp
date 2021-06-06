//
//  ViewController.swift
//  LinkPTX
//
//  Created by 羅珮珊 on 2021/6/6.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var enterBusId: UITextField!
    @IBOutlet weak var setStart: UITextField!
    @IBOutlet weak var setEnd: UITextField!
    @IBOutlet weak var intervalTime: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func saveInfo(_ sender: Any) {
        print("save")
    }
}

