//
//  RocketLaunchViewModel.swift
//  Quanti test
//
//  Created by Venda Pernička on 03.07.2023.
//

import Foundation
import Combine
import CoreMotion

struct RocketLaunchViewModel {
  
  
  let gravityManager = GravityManager()
  
  let phoneWasVertical:AnyPublisher<Bool, Never>
  let description:AnyPublisher<String, Never>

  
  
  init() {
    phoneWasVertical = gravityManager.gravityWillChange
      .map { data in
        data.y < -0.99
      }
      .first(where: { $0 })
      .eraseToAnyPublisher()
    
    description = phoneWasVertical
      .map { phoneWasVertical in
        phoneWasVertical ? "Launch successful !" : "Move your phone up\nto launch the rocket"
      }
      .eraseToAnyPublisher()
  }

  func startUpdate() {
    gravityManager.start()
  }
  
  func stopUpdate() {
    gravityManager.stop()
  }
}
