//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the Json file
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to relocated \(file) in bundle")
        }
        
        //2. Create a property for a data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(url)")
        }
        
        //3. Create decoder
        let decoder = JSONDecoder()
        
        //4. Create property for decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from bundle.")
        }
        
        //5. Return the ready-to-use data
        
        return loaded
        
    }
}
