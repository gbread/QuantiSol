//
//  RocketViewModel.swift
//  Quanti test
//
//  Created by Venda Pernička on 29.06.2023.
//

import Foundation
import Combine

class RocketViewModel {
  
  private let rockets = CurrentValueSubject<[Rocket], Never>([Rocket]())
  let errorMessage = CurrentValueSubject<String?, Never>(nil)
  let spaceXAPI = SpaceXAPI()
  var cancellables = Set<AnyCancellable>()
  let rocketCells = CurrentValueSubject<[RocketCellViewModel], Never>([RocketCellViewModel]())
  
  init() {
  }
  
  func loadRockets() {
    
    // TODO: could be done better probably
    spaceXAPI.getAllRockets().sink { completion in
      // TODO: handle error
    } receiveValue: { [weak self] rockets in
      self?.rockets.value = rockets
    }
    .store(in: &cancellables)
    
    rockets
      .map{ $0.map { RocketCellViewModel(rocket: $0)} }
      .subscribe(rocketCells)
      .store(in: &cancellables)
  }
    
}
