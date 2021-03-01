//
//  ViewController.swift
//  Task1
//
//  Created by Никита Гусев on 27.02.2021.
//

import UIKit
import InputMask

class ViewController: UIViewController {
    @IBOutlet var dateDelegate: MaskedTextFieldDelegate!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var convertedDateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTF.delegate = dateDelegate
        convertButton.layer.cornerRadius = 10
        dateTF.layer.cornerRadius = 10
        dateTF.setLeftPaddingPoints(10)
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = .current
    }

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        if let dateText = dateTF.text, dateText.count == 10, let date = dateFormatter.date(from: dateText) {
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            let day = components.day!
            let decade = day % 10 == 0 || day == 31 ? day / 10 : day / 10 + 1
            let decadeText = Decade(decadeNumber: decade).rawValue
            let monthText = Month(monthNumber: components.month!).rawValue
            convertedDateLabel.text = decadeText + monthText + isLeapYear(year: components.year!)
        } else {
            convertedDateLabel.text = "Введите корректную дату"
        }
    }
    
    private func isLeapYear(year: Int) -> String {
        if year % 4 != 0 || year % 100 == 0 && year % 400 != 0{
            return " невисокосного года"
        } else {
            return " високосного года"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

