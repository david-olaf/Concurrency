//
//  ProjectViewController.swift
//  AeonLMS
//
//  Created by Mike Frellerer on 8/1/16.
//  Copyright © 2016 Mike. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {

    @IBOutlet weak var lblProjectTitle: UILabel!
    @IBOutlet weak var viewShift: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var projectTitle: String!
    var index = [Int](repeating: 1000, count: 20)
    var numberOfCells = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberOfCells = 20
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        initViewShift(3)
    }
    
    
    // MARK: - Initialize View
    
    func initView() {
        
        lblProjectTitle.text = projectTitle
    }
    
    func initViewShift(_ times: Int) {
        
        var time = 0
        while time < times {
            
            let button = UIButton()
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 15.0)
            
            if time == times - 1 {
                button.frame = CGRect(x: (CGFloat(time) * viewShift.frame.width / CGFloat(times)), y: 0, width: viewShift.frame.width - (CGFloat(time) * viewShift.frame.width / CGFloat(times)), height: viewShift.frame.height)
            }
            else {
                button.frame = CGRect(x: (CGFloat(time) * viewShift.frame.width / CGFloat(times)), y: 0, width: viewShift.frame.width / CGFloat(times), height: viewShift.frame.height)
            }
            button.backgroundColor = UIColor(red: 30/255.0, green: (140 + CGFloat(time) * 20)/255.0, blue: 1.0, alpha: 0.7)
            
            if time == 0 {
                button.setTitle("1st Shift", for: UIControlState())
            }
            else if time == 1 {
                button.setTitle("2nd Shift", for: UIControlState())
            }
            else if time == 2 {
                button.setTitle("3rd Shift", for: UIControlState())
            }
            else {
                button.setTitle(String(time + 1) + "th Shift", for: UIControlState())
            }
            
            button.tag = time + 700
            button.addTarget(self, action: #selector(self.onBtnShift(_:)), for: UIControlEvents.touchUpInside)
            viewShift.addSubview(button)
            
            time += 1
        }
    }
    

    // MARK: - IBActions
    
    @IBAction func onBtnBack(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Actions for shift button
    
    func onBtnShift(_ sender: UIButton) {
        
        let index = sender.tag - 700
        if index == 0 {
            numberOfCells = 20
            tableView.reloadData()
        }
        else if index == 1 {
            numberOfCells = 10
            tableView.reloadData()
        }
        else {
            numberOfCells = 5
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Actions for cell button
    
    func onBtnAttendance(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath(row: sender.tag, section: 0)
        
        var i = 0
        while i < 20 {
            index[i] = 1000
            i += 1
        }
        index[sender.tag] = sender.tag

        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        
        if cell.frame.height != 38.0 {
            index[sender.tag] = 1000
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
    
    func onBtnAIL(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath(row: sender.tag - 100, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        cell.btnAttendance.backgroundColor = UIColor(red: 1.0, green: 112/255.0, blue: 125/255.0, alpha: 0.7)
        cell.btnAttendance.setTitle("AIL", for: UIControlState())
        index[sender.tag - 100] = 1000
        tableView.reloadData()
    }
    
    func onBtnABL(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath(row: sender.tag - 200, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        cell.btnAttendance.backgroundColor = UIColor(red: 1.0, green: 112/255.0, blue: 125/255.0, alpha: 0.7)
        cell.btnAttendance.setTitle("ABL", for: UIControlState())
        index[sender.tag - 200] = 1000
        tableView.reloadData()
    }
    
    func onBtnUPL(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath(row: sender.tag - 300, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        cell.btnAttendance.backgroundColor = UIColor(red: 1.0, green: 112/255.0, blue: 125/255.0, alpha: 0.7)
        cell.btnAttendance.setTitle("UPL", for: UIControlState())
        index[sender.tag - 300] = 1000
        tableView.reloadData()
    }
    
    func onBtnHL(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath(row: sender.tag - 400, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        cell.btnAttendance.backgroundColor = UIColor(red: 1.0, green: 112/255.0, blue: 125/255.0, alpha: 0.7)
        cell.btnAttendance.setTitle("HL", for: UIControlState())
        index[sender.tag - 400] = 1000
        tableView.reloadData()
    }
    
    func onBtnMC(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath.init(row: sender.tag - 500, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        cell.btnAttendance.backgroundColor = UIColor(red: 1.0, green: 112/255.0, blue: 125/255.0, alpha: 0.7)
        cell.btnAttendance.setTitle("MC", for: UIControlState())
        index[sender.tag - 500] = 1000
        tableView.reloadData()
    }
    
    func onBtnPresent(_ sender: UIButton) {
        
        let indexPath: IndexPath = IndexPath.init(row: sender.tag - 600, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! StaffsTableViewCell
        cell.btnAttendance.backgroundColor = UIColor(red: 34/255.0, green: 192/255.0, blue: 100/255.0, alpha: 0.7)
        cell.btnAttendance.setTitle("P", for: UIControlState())
        index[sender.tag - 600] = 1000
        tableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCellStaff") as! StaffsTableViewCell
        
        if (indexPath as NSIndexPath).row == 5 {
            cell.lblStaff.backgroundColor = UIColor(red: 1.0, green: 112/255.0, blue: 125/255.0, alpha: 0.7)
        }
        
        // Set tags of cell elements
        cell.btnAttendance.tag = (indexPath as NSIndexPath).row
        cell.btnAIL.tag = (indexPath as NSIndexPath).row + 100
        cell.btnABL.tag = (indexPath as NSIndexPath).row + 200
        cell.btnUPL.tag = (indexPath as NSIndexPath).row + 300
        cell.btnHL.tag = (indexPath as NSIndexPath).row + 400
        cell.btnMC.tag = (indexPath as NSIndexPath).row + 500
        cell.btnPresent.tag = (indexPath as NSIndexPath).row + 600
        
        // Declare actions of cell button
        cell.btnAttendance.addTarget(self, action: #selector(ProjectViewController.onBtnAttendance(_:)), for: UIControlEvents.touchUpInside)
        cell.btnAIL.addTarget(self, action: #selector(ProjectViewController.onBtnAIL(_:)), for: UIControlEvents.touchUpInside)
        cell.btnABL.addTarget(self, action: #selector(ProjectViewController.onBtnABL(_:)), for: UIControlEvents.touchUpInside)
        cell.btnUPL.addTarget(self, action: #selector(ProjectViewController.onBtnUPL(_:)), for: UIControlEvents.touchUpInside)
        cell.btnHL.addTarget(self, action: #selector(ProjectViewController.onBtnHL(_:)), for: UIControlEvents.touchUpInside)
        cell.btnMC.addTarget(self, action: #selector(ProjectViewController.onBtnMC(_:)), for: UIControlEvents.touchUpInside)
        cell.btnPresent.addTarget(self, action: #selector(ProjectViewController.onBtnPresent(_:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        if index[(indexPath as NSIndexPath).row] == (indexPath as NSIndexPath).row {
            return 70
        }
        return 38
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "storyIDCasualLabour")
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
