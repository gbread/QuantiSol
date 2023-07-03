//
//  RocketDetailsViewController.swift
//  Quanti test
//
//  Created by Venda Pernička on 29.06.2023.
//

import Foundation
import UIKit

class RocketDetailsViewController : UIViewController{
  
  var rocketDetailsViewModel: RocketDetailViewModel!
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var heightParameterView: RocketParameterView!
  @IBOutlet weak var diameterParameterView: RocketParameterView!
  @IBOutlet weak var massParameterView: RocketParameterView!
  
  @IBOutlet weak var firstStageView: RocketStageView!
  @IBOutlet weak var secondStageView: RocketStageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = rocketDetailsViewModel.title
    descriptionLabel.text = rocketDetailsViewModel.overview
    
    heightParameterView.setViewModel(viewModel: rocketDetailsViewModel.height)
    diameterParameterView.setViewModel(viewModel: rocketDetailsViewModel.diameter)
    massParameterView.setViewModel(viewModel: rocketDetailsViewModel.mass)

    firstStageView.setViewModel(viewModel: rocketDetailsViewModel.firstStage)
    secondStageView.setViewModel(viewModel: rocketDetailsViewModel.secondStage)

    
  }
}
