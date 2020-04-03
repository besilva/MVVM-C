//
//  Bindable.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

final class Bindable<T> {
  //1
  typealias Listener = (T) -> Void
  var listener: Listener?
  //2
  var value: T {
    didSet {
      listener?(value)
    }
  }
  //3
  init(_ value: T) {
    self.value = value
  }
  //4
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
