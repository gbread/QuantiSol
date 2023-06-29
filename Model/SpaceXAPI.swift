//
//  SpaceXAPI.swift
//  Quanti test
//
//  Created by Venda Pernička on 28.06.2023.
//

import Foundation
import Combine

class SpaceXAPI {
  init() {}
  
  enum SpaceXAPIError: Error {
    case invalidURL
  }
  
  func getAllRockets() -> AnyPublisher<[Rocket], Error>  {
      guard let url = URL(string: "https://api.spacexdata.com/v3/rockets") else {
        return Fail(error: SpaceXAPIError.invalidURL)
          .eraseToAnyPublisher()
      }
      return URLSession.shared.dataTaskPublisher(for: url)
      .compactMap({ $0.data })
      .decode(type: [Rocket].self, decoder: jsonDecoder)
      .eraseToAnyPublisher()
  }
}


var jsonDecoder: JSONDecoder {
     let decoder = JSONDecoder()
     //decoder.keyDecodingStrategy = .useDefaultKeys
     return decoder
  }
