//
//  Mark.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit
@objc protocol Mark {
//    var lastChild:Mark{get set}
    
    optional func addMark(child:Mark)
    optional func removeMark(child:Mark)
}

