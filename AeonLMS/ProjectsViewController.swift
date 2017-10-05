//
//  ProjectsViewController.swift
//  AeonLMS
//
//  Created by David Family on 8/1/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit
import Alamofire

class ProjectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    var arrProject = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        getProjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Networking
    
    func getProjects() {
        
        let AeonConstant = Constant()
        let requestURL = AeonConstant.baseURL + "/get_projectlist"
        Alamofire.request(requestURL, method: .post).responseJSON { (response) in
            switch response.result {
            case .success(let json as AnyObject):
                self.arrProject = (json["projects"] as! NSArray)
                break
            case .failure(let error):
                print(error)
                break
            default:
                break
            }
        }
    }

    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCellProject") as! ProjectsTableViewCell
        
//        if arrProject.count > 0 {
//            
//            let project = Project(object: arrProject[indexPath.row] as AnyObject)
//            cell.lblProjectName.text = project.title
//            cell.lblDuration.text = project.startp + "~" + project.endp
//        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath) as! ProjectsTableViewCell
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "IDStoryProject") as! ProjectViewController
        viewController.projectTitle = cell.lblProjectName.text
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
