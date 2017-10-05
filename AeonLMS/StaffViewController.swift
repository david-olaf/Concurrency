//
//  StaffViewController.swift
//  AeonLMS
//
//  Created by David Family on 8/3/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class StaffViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - IBActions

    @IBAction func onBtnBack(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
}
