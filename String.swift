//
//  String.swift
//
//  Created by Julian Jans on 28/07/2018.
//

import Foundation

extension String {
    
    func regex(_ pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression) != nil
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func fullfills(_ string: String) -> Bool {
        return string.removingWhitespaces().uppercased() == self.removingWhitespaces().uppercased()
    }
    
    func camelCase() -> String {
        return self.components(separatedBy: " ").map { $0.capitalized }.joined()
    }
    
    func lowerCamelCase() -> String {
        let camelCase = self.camelCase()
        return camelCase.prefix(1).lowercased() + camelCase.dropFirst()
    }
    
}
