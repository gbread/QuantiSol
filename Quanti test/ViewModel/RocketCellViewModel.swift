//
//  RocketCellViewModel.swift
//  Quanti test
//
//  Created by Venda Pernička on 29.06.2023.
//

import Foundation
import UIKit

struct RocketCellViewModel {
  var rocketName: String
  var rocketFirstStartFormatted: String!
  var rocketIcon: UIImage?
  
  init(rocket: Rocket) {
    rocketName = rocket.rocket_name
    rocketFirstStartFormatted = "First flight: \(getRocketFirstFlightFormatted(rocket: rocket) ?? "Never")"
    rocketIcon = UIImage(named: "Rocket")
  }
  
  func getRocketFirstFlightFormatted(rocket: Rocket) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: rocket.first_flight) else {
      return nil
    }
    dateFormatter.dateFormat = "d. M. yyyy"
    let result = dateFormatter.string(from: date)
    return result
  }
}
