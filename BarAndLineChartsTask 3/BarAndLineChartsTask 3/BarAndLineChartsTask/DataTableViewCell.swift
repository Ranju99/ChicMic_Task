//
//  DataTableViewCell.swift
//  BarAndLineChartsTask
//
//  Created by ChicMic Technologies on 31/03/23.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var monthTextLabel: UILabel!
    @IBOutlet weak var bandTextLabel: UILabel!
    @IBOutlet weak var designationTextLabel: UILabel!
    @IBOutlet weak var salaryTextLabel: UILabel!
    @IBOutlet weak var incrementTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
