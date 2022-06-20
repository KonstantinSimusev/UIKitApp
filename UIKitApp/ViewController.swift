//
//  ViewController.swift
//  UIKitApp
//
//  Created by Konstantin Simusev on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.font = mainLabel.font.withSize(28)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .systemBlue
        slider.maximumTrackTintColor = .systemPink
        slider.thumbTintColor = .white
        
        mainLabel.text = String(slider.value)
    }
    
    @IBAction func setSegmentedControl() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first red segment"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second blue segment"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third white segment"
            mainLabel.textColor = .white
        }
    }
    
    @IBAction func setSlider() {
        mainLabel.text = String(format: "%.1f", slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
//        view.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }

    @IBAction func doneButtonPresssed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(title: "Text Field is empty", message: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format", message: "Please enter your name")
            return
        }
        
        mainLabel.text = textField.text
        textField.text = ""
    }
}
// MARK: - Private Methods
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
