//
//  RocketLaunchViewController.swift
//  Quanti test
//
//  Created by Venda Pernička on 03.07.2023.
//

import UIKit
import Combine
import CoreMotion

class RocketLaunchViewController : UIViewController {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var rocketImageView: UIImageView!
  
  var cancellables = Set<AnyCancellable>()
  var viewModel = RocketLaunchViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.phoneWasVertical
      .sink { [weak self] wasVertical in
        if wasVertical {
          self?.animateRocketStart()
        }
      }
      .store(in: &cancellables)

    viewModel.description.sink { [weak self] description in
      self?.descriptionLabel.text = description
    }
    .store(in: &cancellables)
    
    viewModel.startUpdate()
  }
  
  func animateRocketStart() {
     // probably should be part of custom rocket view
    rocketImageView.image = UIImage(named: "Rocket Flying")
    UIView.animate(withDuration: 2) { [weak self] in
      guard let rocketSize = self?.rocketImageView.image?.size,
            let viewHeight = self?.view.bounds.height
      else {
        print("No rocket image")
        return
      }
      self?.rocketImageView.transform = CGAffineTransform(translationX: 0, y: -viewHeight)
    }
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewModel.stopUpdate()
    
  }
}
