//
//  ViewController.swift
//  SentDataDelagate
//
//  Created by Admin on 11/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol MasterDelegate: class {
    func sentData(data: String)
    
}
class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    
    weak var delegate: MasterDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        delegate?.sentData(data: nameText.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
}

