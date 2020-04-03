//
//  Router.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

protocol Router {
    var host: String { get }
    var path:String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}
