//
//  ViewController.swift
//  Quanti test
//
//  Created by Venda Pernička on 27.06.2023.
//

import UIKit
import Combine


class RocketsTableViewController: UITableViewController {

  let rocketViewModel = RocketViewModel()
  var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Rockets"
    
    rocketViewModel.rockets.receive(on: RunLoop.main)
        .sink { complete in
      print(complete)
    } receiveValue: { [weak self] rockets in
      print(rockets)
      self?.tableView.reloadData()
    }
    .store(in: &cancellables)

    rocketViewModel.loadRockets()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rocketViewModel.rockets.value.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let rocket = RocketCellViewModel(rocket: rocketViewModel.rockets.value[indexPath.row])
    cell.textLabel?.text = rocket.rocketName
    cell.detailTextLabel?.text = rocket.rocketFirstStartFormatted
    cell.imageView?.image = rocket.rocketIcon
    return cell
  }

}

