//
//  UIDate.swift
//  iKidz
//
//  Created by luan on 7/15/17.
//  Copyright © 2017 Luan Tran. All rights reserved.
//

import UIKit

// MARK: Time
let secondPerMinute = 60
let minutePerHour = 60
let hourPerDay = 24

extension Date {
    init?(string: String?, format: String) {
        guard let string = string else {
            return nil
        }
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        guard let date = dateFormater.date(from: string) else {
            return nil
        }
        self = date
    }
    
    init(milliSecondsSince1970: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliSecondsSince1970 / 1000))
    }
    
    var millisecondsSince1970:Int {
        return Int((timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var periodConvenient: String {
        let curDate = Date()
        let denta = curDate.timeIntervalSince(self)
        
        let seconds = lround(denta)
        
        if seconds < secondPerMinute {
            return "Just now"
        }
        
        let minute = seconds / secondPerMinute
        if minute < minutePerHour {
            return "\(minute) min\(minute > 1 ? "s" : "")"
        }
        
        let hour = minute / minutePerHour
        if hour < hourPerDay {
            return "\(hour) hour\(hour > 1 ? "s" : "")"
        }
        
        let days = hour / hourPerDay
        let dateFormatter = DateFormatter()
        
        if days == 1 {
            dateFormatter.dateFormat = "'Yesterday at 'h:mma"
            return dateFormatter.string(from: self)
        }
        
        let curComponents = (Calendar.current as NSCalendar).components([.month, .year], from: curDate)
        let components = (Calendar.current as NSCalendar).components([.month, .year], from: self)
        if components.year == curComponents.year && components.month == curComponents.month {
            dateFormatter.dateFormat = "MMM d at h:mma"
        } else if components.year == curComponents.year {
            dateFormatter.dateFormat = "MMM d"
        } else {
            dateFormatter.dateFormat = "MMM d, yyyy"
        }
        
        return dateFormatter.string(from: self)
    }
    
    func string(dateFormat format: String) -> String? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.string(from: self)
    }
}
