//
//  Extensions.swift
//  Netflix-Clone
//
//  Created by Muhammed Enes Kılıçlı on 24.02.2023.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
    
    
}
