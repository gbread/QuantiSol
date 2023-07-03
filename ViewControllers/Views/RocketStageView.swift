//
//  RocketStageView.swift
//  Quanti test
//
//  Created by Venda Pernička on 01.07.2023.
//

import Foundation
import UIKit

class RocketStageView : UIView, NibLoadable {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var reusableRow: RocketStageRowView!
  
  @IBOutlet weak var engineRow: RocketStageRowView!
  
  @IBOutlet weak var fuelRow: RocketStageRowView!
  
  @IBOutlet weak var burnTimeRow: RocketStageRowView!
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupFromNib()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupFromNib()
  }
  
  func setViewModel(viewModel: RocketStageViewModel) {
    titleLabel.text = viewModel.title
    
    reusableRow.imageView.image = UIImage(named: "Reusable")
    reusableRow.label.text = viewModel.reusable
    
    engineRow.imageView.image = UIImage(named: "Engine")
    engineRow.label.text = viewModel.engines
    
    fuelRow.imageView.image = UIImage(named: "Fuel")
    fuelRow.label.text = viewModel.fuel
    
    burnTimeRow.imageView.image = UIImage(named: "Burn")
    burnTimeRow.label.text = viewModel.burnTime
  }
  
}
