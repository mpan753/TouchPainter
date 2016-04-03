//
//  SetStrokeColorCommand.swift
//  TouchPainter
//
//  Created by Mia on 4/3/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

protocol SetStrokeColorCommandDelegate {
    
    func command(command: SetStrokeColorCommand, didRequestColorComponentsForRed red:UnsafeMutablePointer<Float>, green:UnsafeMutablePointer<Float>, blue:UnsafeMutablePointer<Float>)
    
    func command(command: SetStrokeColorCommand, didFinishColorUpdateWithColor color: UIColor)
    
}

class SetStrokeColorCommand: Command {
    
    var delegate : SetStrokeColorCommandDelegate?
    
    override func execute() {
        var red : Float = 0
        var green : Float = 0
        var blue : Float = 0

        delegate?.command(self, didRequestColorComponentsForRed:&red, green:&green, blue:&blue)
        let color = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
        let canvasVC = CoordinatingController.sharedCoordinator.canvasViewController!
        canvasVC.strokeColor = color
        delegate?.command(self, didFinishColorUpdateWithColor: color)
        
    }
}
