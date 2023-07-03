//
//  Rocket.swift
//  Quanti test
//
//  Created by Venda Pernička on 28.06.2023.
//

import Foundation

struct Rocket : Codable {
  var id: Int    //"id": 1,
  var active: Bool //"active": false,
  var stages: Int // "stages": 2,
  var boosters: Int //"boosters": 0,
  var cost_per_launch: Int //"cost_per_launch": 6700000,
  var success_rate_pct: Int //"success_rate_pct": 40,
  var first_flight: String //"first_flight": "2006-03-24",
  var country: String //"country": "Republic of the Marshall Islands",
  var company: String //"company": "SpaceX",
  var height: Distance
  var diameter: Distance
  var mass: Mass
  var payload_weights: [PayloadWeight]
  var first_stage: FirstStage
  var second_stage: SecondStage
  var engines: Engines
  var landing_legs: LandingLegs
  var flickr_images: [String]
  var wikipedia: String //"wikipedia": "https://en.wikipedia.org/wiki/Falcon_1",
  var description: String //"description": "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
  var rocket_id: String //"rocket_id": "falcon1",
  var rocket_name: String //"rocket_name": "Falcon 1",
  var rocket_type: String //"rocket_type": "rocket"
    
}

struct Distance: Codable {
  var meters: Double? //"meters": 22.25,
  var feet: Double? //"feet": 73
}

struct Mass: Codable {
  var kg:Int  //"kg": 450,
  var lb:Int  //"lb": 66460
}

struct Force: Codable {
  var kN: Int //"kN": 420,
  var lbf: Int //"lbf": 94000
}

struct PayloadWeight : Codable {
  var id: String
  var name: String
  var kg: Int  //"kg": 450,
  var lb: Int  //"lb": 66460
}

struct FirstStage: Codable {
  var reusable: Bool //"reusable": false,
  var engines: Int //"engines": 1,
  var fuel_amount_tons: Double //"fuel_amount_tons": 44.3,
  var burn_time_sec: Int? //"burn_time_sec": 169,
  var thrust_sea_level: Force
  var thrust_vacuum: Force
}

struct SecondStage: Codable {
  var reusable: Bool //"reusable": false,
  var engines: Int //"engines": 1,
  var fuel_amount_tons: Double //"fuel_amount_tons": 44.3,
  var burn_time_sec: Int? //"burn_time_sec": 169,
  var thrust: Force
  var payloads: Payloads
}

struct Payloads: Codable {
  var option_1:String
  var composite_fairing: CompositeFairing
}

struct CompositeFairing: Codable {
  var height: Distance
  var diameter: Distance
}

struct Engines: Codable {
  var number: Int //"number": 1,
  var type: String //"type": "merlin",
  var version: String //"version": "1C",
  var layout: String? //"layout": "single",
  var engine_loss_max: Int? //"engine_loss_max": 0,
  var propellant_1: String //"propellant_1": "liquid oxygen",
  var propellant_2: String //"propellant_2": "RP-1 kerosene",
  var thrust_sea_level: Force
  var thrust_vacuum: Force
  var thrust_to_weight: Double //"thrust_to_weight": 96
}

struct LandingLegs: Codable {
  var number: Int //"number": 0,
  var material: String? //"material": null
}
