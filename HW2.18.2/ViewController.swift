//
//  ViewController.swift
//  HW2.18.2
//
//  Created by Yuliya Laskova on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coloredView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        /* 1.1 coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)*/
        
        setViewColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }

    /*
   2. redLabel.text = String(format: "%.2f", redSlider.value)
    greenLabel.text = String(format: "%.2f", greenSlider.value)
    blueLabel.text = String(format: "%.2f", blueSlider.value)
*/
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setViewColor()
        
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        default: break
        }
    }
    /* 1. метод который мы использовали бы для изменения цвета ВЬЮ, но тогда будет дублирование кода, так как присвоение цвета выше выглядело также. Чтобы это избежать создаем отельный приватный метод SERCOLOR и передаем уже его
     
     1.1 coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)

   2. тоже самое делвем для лейблов.
    
    redLabel.text = String(format: "%.2f", redSlider.value)
    greenLabel.text = String(format: "%.2f", greenSlider.value)
    blueLabel.text = String(format: "%.2f", blueSlider.value)
   */

    
    private func setViewColor() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

