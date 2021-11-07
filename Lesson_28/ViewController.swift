//
//  ViewController.swift
//  Lesson_28
//
//  Created by Evgeniy Nosko on 27.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var textField: UITextField!
    
    private let stringArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
    }

}

//добавление в текстфилд значение барабана
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let baraban = Baraban (rawValue: component)
        switch baraban {
        case .firstBaraban:
            textField.text = stringArray[row] 
        case .secondBaraban:
            textField.text = stringArray.reversed()[row]
        default:
            break
        }
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringArray.count
    }
    
//    если барабанов больше чем один
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let baraban = Baraban (rawValue: component)
        switch baraban {
        case .firstBaraban:
            return stringArray[row]
        case .secondBaraban:
            return stringArray.reversed()[row]
        default:
            return nil
        }
    }
    
//    кастомизация пикера
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .orange
        
        let baraban = Baraban (rawValue: component)
        switch baraban {
        case .firstBaraban:
            label.text = stringArray[row]
        case .secondBaraban:
            label.text = stringArray.reversed()[row]
        default:
            break
        }
        return label
    }
    
//    ширина барабана
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    
}


enum Baraban: Int {
    case firstBaraban
    case secondBaraban
}
