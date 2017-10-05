//
//  StaffsTableViewCell.swift
//  AeonLMS
//
//  Created by David Family on 8/2/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class StaffsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStaff: UILabel!
    @IBOutlet weak var btnAttendance: UIButton!
    @IBOutlet weak var viewDetailAttendance: UIView!
    @IBOutlet weak var btnAIL: UIButton!
    @IBOutlet weak var btnABL: UIButton!
    @IBOutlet weak var btnUPL: UIButton!
    @IBOutlet weak var btnHL: UIButton!
    @IBOutlet weak var btnMC: UIButton!
    @IBOutlet weak var btnPresent: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
