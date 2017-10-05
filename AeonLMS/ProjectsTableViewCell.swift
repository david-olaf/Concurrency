//
//  ProjectsTableViewCell.swift
//  AeonLMS
//
//  Created by David Family on 8/1/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lblProjectName: UILabel!
    @IBOutlet weak var lblDuration: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
