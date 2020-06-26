//
//  APIError.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/25/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation


struct ErrorModel: Codable  {
    
    let code: Int?
    let message: String?
    let data: [String]?
    
    init(code: Int?, message: String?, data: [String]?) {
        self.code = code
        self.message = message
        self.data = data
    }
}

struct ErrorResponse : Codable {
    
    let error: Bool
    let errors: [ErrorModel]
    
}
