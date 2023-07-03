//
//  RocketDetailViewModel.swift
//  Quanti test
//
//  Created by Venda Pernička on 01.07.2023.
//

import Foundation


struct RocketDetailViewModel {
  var title:String
  var overview:String
  var height, diameter, mass: RocketParametersViewModel?
  var firstStage, secondStage: RocketStageViewModel
  var imageURLs: [String]
  
  init(rocket:Rocket) {
    title = rocket.rocket_name
    overview = rocket.description
    
    // TODO: value and format based on localization using .stringsdict
    if let rocketHeightMeters = rocket.height.meters {
      height = RocketParametersViewModel(
        valueFormatted: "\(Int(rocketHeightMeters))m",
        valueType: "height")
    }
    
    if let diameterMeters = rocket.diameter.meters {
      diameter = RocketParametersViewModel(
        valueFormatted: "\(Int(diameterMeters))m",
        valueType: "diameter")
    }
    
    mass = RocketParametersViewModel(
      valueFormatted: "\(rocket.mass.kg/1000)t",
      valueType: "mass")
    
    firstStage = RocketStageViewModel(
      title: "First Stage",
      reusable: rocket.first_stage.reusable,
      engines: rocket.first_stage.engines,
      fuelTonsOfFuel: rocket.first_stage.fuel_amount_tons,
      burnTimeSecs: rocket.first_stage.burn_time_sec
    )
    
    secondStage = RocketStageViewModel(
      title: "Second Stage",
      reusable: false,
      engines: rocket.second_stage.engines,
      fuelTonsOfFuel: rocket.second_stage.fuel_amount_tons,
      burnTimeSecs: rocket.second_stage.burn_time_sec
    )
    
    imageURLs = rocket.flickr_images
    
  }
}

struct RocketParametersViewModel {
  var valueFormatted:String
  var valueType:String
}

struct RocketStageViewModel {
  var title:String
  var reusable:String
  var engines:String
  var fuel:String
  var burnTime:String
  
  init(title: String, reusable: Bool, engines: Int, fuelTonsOfFuel: Double, burnTimeSecs: Int?) {
    self.title = title
    self.reusable = reusable ? "reusable" : "not reusable"
    self.engines = String(format: NSLocalizedString("rocketDetailEnginesCount", comment: ""), engines)
    self.fuel = "\(Int(fuelTonsOfFuel)) tons of fuel"
    self.burnTime = "\(burnTimeSecs ?? 0) seconds burn time"
  }
}
