//
//  routerPath.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation

enum Router {
    
 case getProducts

  var scheme: String {
    switch self {
    case .getProducts:
      return "https"
    }
  }
  
  var host: String {
    switch self {
    case .getProducts:
        return Constant.baseURL + Constant.varsionNumber
    }
  }
  
  var path: String {
    switch self {
    case .getProducts:
        return Constant.getProductEndPoints
    }
  }
  
  // 5.
  var parameters: [URLQueryItem] {
    switch self {
    case .getProducts:
      // 6.
      return []
    }
  }
    var method: String {
            switch self {
            case .getProducts:
                return "GET"
            }
        }
}
