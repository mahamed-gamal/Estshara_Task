//
//  LoginModel.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/25/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation


struct LoginModel {
     //MARK:- Request
    struct Request {
        // MARK : - do someting...
        
        func parameters(userName: String , password: String) -> [String: Any]? {
            // MARK : - do someting...
            return ["vie_id": userName , "password": password]
        }
       
   }
    //MARK:- Response
struct LoginResponse: Codable {
    let result, token: String?
  }
}
