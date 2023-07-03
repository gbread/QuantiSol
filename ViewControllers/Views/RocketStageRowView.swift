//
//  RocketSageRowView.swift
//  Quanti test
//
//  Created by Venda Pernička on 01.07.2023.
//

import UIKit

class RocketStageRowView: UIView, NibLoadable {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var label: UILabel!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupFromNib()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupFromNib()
  }

}
