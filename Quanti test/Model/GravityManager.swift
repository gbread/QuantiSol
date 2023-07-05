//
//  DeviceMotionManager.swift
//  Quanti test
//
//  Created by Venda Pernička on 03.07.2023.
//

import CoreMotion
import Foundation
import Combine

public class GravityManager: ObservableObject {
  private var motionQueue = OperationQueue.main
  let motionManager = CMMotionManager()
  public var updateInterval : Double
  
  @Published private var _active : Bool
  
  public var active: Bool {
    get { self._active }
  }
  
  public init(){
    _active = false
    updateInterval = 0.01
  }
  
  public let gravityWillChange = PassthroughSubject<CMAcceleration, Never>()
  
  @Published public private(set) var gravity: CMAcceleration? {
    willSet {
      if let newValue=newValue {
        gravityWillChange.send(newValue)
      }
    }
  }
  
  public func start() {
    if !self._active {
      if motionManager.isDeviceMotionAvailable {
        print("motion started")
        motionManager.deviceMotionUpdateInterval = updateInterval
        motionManager.showsDeviceMovementDisplay = true
        motionManager.startDeviceMotionUpdates(
          using: .xArbitraryZVertical,
          to: motionQueue) { [self] (motion, error) in
            if let motion = motion {
              self.gravity = motion.gravity
            }
          }
      }
      else {
        print("No motion available")
      }
      self._active = true
    }
  }
  
  public func stop() {
    if motionManager.isDeviceMotionAvailable {
      motionManager.stopDeviceMotionUpdates()
      print("motion stopped")
    }
    self._active = false
  }
}
