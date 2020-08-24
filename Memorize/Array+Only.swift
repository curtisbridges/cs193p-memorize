//
//  Array+Only.swift
//  Memorize
//
//  Created by Curtis Bridges on 8/24/20.
//  Copyright © 2020 Curtis Bridges. All rights reserved.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
