//
//  PaletteViewController.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/19/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController, SetStrokeColorCommandDelegate, SetStrokeSizeCommandDelegate {
    
    @IBOutlet var redSlider: CommandSlider!
    @IBOutlet var greenSlider: CommandSlider!
    @IBOutlet var blueSlider: CommandSlider!
    @IBOutlet var sizeSlider: CommandSlider!
    @IBOutlet var paletteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userDefault = NSUserDefaults.standardUserDefaults()
        redSlider.value = userDefault.floatForKey("red")
        greenSlider.value = userDefault.floatForKey("green")
        blueSlider.value = userDefault.floatForKey("blue")
        paletteView.backgroundColor = UIColor(colorLiteralRed: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: 1)
        (redSlider.command as! SetStrokeColorCommand).delegate = self
        (greenSlider.command as! SetStrokeColorCommand).delegate = self
        (blueSlider.command as! SetStrokeColorCommand).delegate = self
        (sizeSlider.command as! SetStrokeSizeCommand).delegate = self
    }

    override func viewDidDisappear(animated: Bool) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setValue(redSlider.value, forKey: "red")
        userDefault.setValue(greenSlider.value, forKey: "green")
        userDefault.setValue(blueSlider.value, forKey: "blue")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var coordinatingController: CoordinatingController!
    @IBAction func dismissViewController(sender: AnyObject) {
        coordinatingController.requestViewChangeByObject(sender)
    }

    @IBAction func onCommandSliderValueChanged(slider: CommandSlider) {
        
        slider.command?.execute()
    }
    
    // MARK: SetStrokeColorCommandDelegate
    
    func command(command: SetStrokeColorCommand, didRequestColorComponentsForRed red: UnsafeMutablePointer<Float>, green: UnsafeMutablePointer<Float>, blue: UnsafeMutablePointer<Float>) {
        red.memory = redSlider.value
        green.memory = greenSlider.value
        blue.memory = blueSlider.value
    }
    
    func command(command: SetStrokeColorCommand, didFinishColorUpdateWithColor color: UIColor) {
        paletteView.backgroundColor = color
    }
    
    // MARK: SetStrokeSizeCommandDelegate
    
    func command(command: SetStrokeSizeCommand, didRequestForStrokeSize size: UnsafeMutablePointer<Float>) {
        size.memory = sizeSlider.value
    }
    
}
