//
//  Mark.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit
protocol Mark <NSObject> {
//    var lastChild:Mark{get set}
    var color: UIColor?{get set}
    var location: CGPoint {get set}
    var size: Float {get set}
    
    func addMark(child:Mark)
    func removeMark(child:Mark)
}

