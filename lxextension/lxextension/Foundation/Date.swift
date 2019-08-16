//
//  UIDate.swift
//  iKidz
//
//  Created by luan on 7/15/17.
//  Copyright © 2017 Luan Tran. All rights reserved.
//

import Foundation

// MARK: Time
let secondPerMinute = 60
let minutePerHour = 60
let hourPerDay = 24

public extension Date {
    
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
    
    var dateConvenientText: String {
        if isInToday {
            return "TODAY"
        }
        if isInYesterday {
            return "YESTERDAY"
        }
        let dateFormatter = DateFormatter()
        if isInThisWeek {
            dateFormatter.dateFormat = "EEEE"
        } else if isInThisYear {
            dateFormatter.dateFormat = "MMM d"
        } else {
            dateFormatter.dateFormat = "MMM d, yyyy"
        }
        return dateFormatter.string(from: self)
    }
    
    func isInSameWeek(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
    }
    
    func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    
    func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    
    func isInSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
    }
    
    var isInThisYear: Bool {
        return isInSameYear(date: Date())
    }
    
    var isInThisWeek: Bool {
        return isInSameWeek(date: Date())
    }
    
    var isInYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isInTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    var isInTheFuture: Bool {
        return Date() < self
    }
    
    var isInThePast: Bool {
        return self < Date()
    }
    
    func string(dateFormat format: String) -> String? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.string(from: self)
    }
    
}
