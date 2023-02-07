//
//  ViewController.swift
//  appFindDay
//
//  Created by Emil on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func findDay(_ sender: Any) {
        
        //MARK: guard - удостоверяемся что можем получить элемент
        //MARK: for skip optional
        guard let day = dateTF.text, let month = monthTF.text, let year = year.text else { return }
        
        //MARK: make object calendar
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        //MARK: set a date format
        let dateFormat = DateFormatter()
        
        //MARK: set locale language, country
        dateFormat.locale = Locale(identifier: "ru_ Ru")
        dateFormat.dateFormat = "EEEE"
        
        //MARK: exam a elements of dataComponents
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dayFromCalendar = dateFormat.string(from: date)
        
        //MARK: for Cap a first letter(букву)
        let labelCapitalized = dayFromCalendar.capitalized
        
        //MARK: to label
        label.text = labelCapitalized
        
    }
    
    //MARK: for hide a keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
}

