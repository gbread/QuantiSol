//
//  ViewController.swift
//  Quanti test
//
//  Created by Venda Pernička on 27.06.2023.
//

import UIKit
import Combine


class RocketsTableViewController: UITableViewController {

  var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    SpaceXAPI().getAllRockets().sink { complete in
      print(complete)
    } receiveValue: { rockets in
      print(rockets)
    }
    .store(in: &cancellables)

  }

  

}

