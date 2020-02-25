//
//  stuff.swift
//  FormalDinnerSeating
//
//  Created by Charlie Heyman on 2/21/20.
//  Copyright © 2020 Cate. All rights reserved.
//

import Foundation

enum StudentError: Error{
    case noDataAvailable
    case canNotProcessData
}

struct Request {
    let reqURL:URL
    init() {
        let reqString = "https://localhost:80"
        guard let reqURL = URL(string: reqString) else {fatalError()}
        self.reqURL = reqURL
        
    }
    
    func getStudents(completion: @escaping(Result<[info], StudentError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: reqURL){ data, _, _ in
        guard let Data = data else {
            completion(.failure(.noDataAvailable))
            return
        }
        do {
            let decoder = JSONDecoder()
            print(Data)
            let studentResponse = try decoder.decode(list.self, from: Data)
            let Seating = studentResponse.studentList
            print("in function getStudents")
            print(Seating)
            // return studentDetails to caller on Success (as it returns data to the caller upon successful completion)
            completion(.success(Seating))
        } catch {
            completion(.failure(.canNotProcessData))
        }
        }
        // without this nothing works...
    dataTask.resume()
   
    }
    
}


