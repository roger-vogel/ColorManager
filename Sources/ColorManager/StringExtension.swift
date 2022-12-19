//
//  File.swift
//  
//
//  Created by Roger Vogel on 12/19/22.
//

import Foundation
import UIKit

extension String {
    
    // MARK: - SUBSCRIPTING
    subscript(i: Int) -> String {
        
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    func partial (fromIndex: Int, length: Int) -> String {
        
        let fullString: String = self
        var partialString: String = ""
        
        guard length <= fullString.count && fromIndex <= (fullString.count - length) else { return "" }
        
        for i in fromIndex...(fromIndex + length - 1) { partialString += fullString[i] }
        
        return partialString
    }
}
