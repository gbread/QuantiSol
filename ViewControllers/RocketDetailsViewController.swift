//
//  RocketDetailsViewController.swift
//  Quanti test
//
//  Created by Venda Pernička on 29.06.2023.
//

import Foundation
import UIKit
import SDWebImage

class RocketDetailsViewController : UIViewController{
  
  var rocketDetailsViewModel: RocketDetailViewModel!
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var heightParameterView: RocketParameterView!
  @IBOutlet weak var diameterParameterView: RocketParameterView!
  @IBOutlet weak var massParameterView: RocketParameterView!
  
  @IBOutlet weak var firstStageView: RocketStageView!
  @IBOutlet weak var secondStageView: RocketStageView!
  
  @IBOutlet weak var photosStackView: UIStackView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.largeTitleDisplayMode = .never
    title = rocketDetailsViewModel.title
    descriptionLabel.text = rocketDetailsViewModel.overview
    
    heightParameterView.setViewModel(viewModel: rocketDetailsViewModel.height)
    diameterParameterView.setViewModel(viewModel: rocketDetailsViewModel.diameter)
    massParameterView.setViewModel(viewModel: rocketDetailsViewModel.mass)

    firstStageView.setViewModel(viewModel: rocketDetailsViewModel.firstStage)
    secondStageView.setViewModel(viewModel: rocketDetailsViewModel.secondStage)

    photosStackView.translatesAutoresizingMaskIntoConstraints = false
    rocketDetailsViewModel.imageURLs
      .forEach { imageURLString in
        // TODO: possibly could be a custom class
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200))
        photosStackView.addArrangedSubview(imageView)
        imageView.sd_setImage(with: URL(string: imageURLString), placeholderImage: UIImage(named: "rocketError")) { image, error, cacheType, url in
          imageView.superview?.setNeedsLayout()
          
        }
      }
  }
}
