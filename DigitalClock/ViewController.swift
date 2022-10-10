//
//  ViewController.swift
//  DigitalClock
//
//  Created by Trần Văn Cam on 08/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setupTimer()
    }
    
    func setupUI() {
        hourLabel.clipsToBounds = true
        hourLabel.layer.cornerRadius = 10
        // layer là các lớp hiển thị giao diện cho 1 view
        // 1 view có thể có nhiều layer
        // Biên của layer không phải hình chữ nhật
        
        minLabel.clipsToBounds = true
        minLabel.layer.cornerRadius = 10
        secLabel.clipsToBounds = true
        secLabel.layer.cornerRadius = 10
        
        // Đánh dấu góc cần bo
        secLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            let currentDate = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day, .month, .year, .hour, .minute, .second], from: currentDate)
            
            self.hourLabel.text = self.convertIntToString(components.hour!)
            self.minLabel.text = self.convertIntToString(components.minute!)
            self.secLabel.text = self.convertIntToString(components.second!)
            
            self.dateLabel.text = "\(components.day!) / \(components.month!) / \(components.year!)"
        })
    }
    
    func convertIntToString(_ number: Int) -> String {
        if number < 10 {
            return "0\(number)"
        }
        return "\(number)"
    }

}

