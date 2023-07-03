//
//  RocketParameterView.swift
//  Quanti test
//
//  Created by Venda Pernička on 01.07.2023.
//

import Foundation
import UIKit

@IBDesignable
class RocketParameterView : UIView, NibLoadable {
  @IBOutlet weak var valueLabel: UILabel!
  
  @IBOutlet weak var typeLabel: UILabel!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupFromNib()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupFromNib()
  }
  
  func setViewModel(viewModel: RocketParametersViewModel?) {
    valueLabel.text = viewModel?.valueFormatted
    typeLabel.text = viewModel?.valueType
  }
}
