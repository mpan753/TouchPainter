//
//  SetStrokeSizeCommand.swift
//  TouchPainter
//
//  Created by Mia on 4/3/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

protocol SetStrokeSizeCommandDelegate {
    
    func command(command: SetStrokeSizeCommand, didRequestForStrokeSize size: UnsafeMutablePointer<Float>)
}

class SetStrokeSizeCommand: Command {

    var delegate : SetStrokeSizeCommandDelegate?
 
    override func execute() {
        var size : Float = 0
        delegate?.command(self, didRequestForStrokeSize: &size)
        let canvasVC = CoordinatingController.sharedCoordinator.canvasViewController!
        canvasVC.strokeSize = size
    }
    
}
