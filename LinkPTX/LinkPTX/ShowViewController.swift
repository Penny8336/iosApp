//
//  ShowViewController.swift
//  LinkPTX
//
//  Created by 羅珮珊 on 2021/6/6.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var busID: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var intervalTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func correctInfo(_ sender: Any) {
        print("hi there correctInfo")
    }

    @IBAction func confirmInfo(_ sender: Any) {
        print("hi there confirmInfo")
        popAlert(titleInput: "Confirm", messageInput: "confirm setting")
    }
    //    @IBAction func confirmInfo(_ sender: Any) {
//
//
//    }
//
    func popAlert(titleInput: String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}
