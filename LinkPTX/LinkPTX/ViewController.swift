//
//  ViewController.swift
//  LinkPTX
//
//  Created by 羅珮珊 on 2021/6/6.
//

import UIKit

class ViewController: UIViewController {

    var busID = ""
    @IBOutlet weak var busIdTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var intervalTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

    }


    @IBAction func saveInfo(_ sender: Any) {
        busID = busIdTextField.text!
        print("saveInfo")
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView"{
            let destinationVC = segue.destination as! ShowViewController
            destinationVC.setBusID = busID
        }
    }
}

