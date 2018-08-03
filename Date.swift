//
//  Date.swift
//
//  Created by Julian Jans on 02/08/2018.
//  Copyright © 2016 Julian Jans. All rights reserved.
//

import Foundation

extension Date {
    
    func timeAgo() -> String {
        
        let calendar = Calendar.current
        
        let seconds  = calendar.component(.second, from: self)
        let minutes  = calendar.component(.minute, from: self)
        let hours    = calendar.component(.hour, from: self)
        let days     = calendar.component(.day, from: self)
        let weeks    = calendar.component(.weekOfMonth, from: self)
        let months   = calendar.component(.month, from: self)
        let years    = calendar.component(.year, from: self)
        
        if (seconds < 60) {
            return NSLocalizedString("Just now", comment: "Very recent")
        } else if (minutes < 60) {
            return "\(minutes)\(NSLocalizedString("m ago", comment: "Minutes ago"))"
        } else if (hours < 24) {
            return (hours == 1) ? "\(hours)\(NSLocalizedString("hr ago", comment: "One hour ago"))" : "\(hours)\(NSLocalizedString("hrs ago", comment: "Hours ago"))"
        } else if (days < 14) {
            return (days == 1) ? "\(days) \(NSLocalizedString("day ago", comment: "One day ago"))" : "\(days) \(NSLocalizedString("days ago", comment: "Days ago"))"
        } else if (days < 31) {
            return (weeks == 1) ? "\(weeks) \(NSLocalizedString("week ago", comment: "One week ago"))" : "\(weeks) \(NSLocalizedString("weeks ago", comment: "Weeks ago"))"
        } else if (months < 12) {
            return (months == 1) ? "\(months) \(NSLocalizedString("month ago", comment: "One month ago"))" : "\(months) \(NSLocalizedString("months ago", comment: "Months ago"))"
        } else {
            return (years == 1) ? "\(years) \(NSLocalizedString("year ago", comment: "One year ago"))" : "\(years) \(NSLocalizedString("years ago", comment: "Years ago"))"
        }
    }
    
}

extension NSDate {
    
    func timeAgo() -> String {
        let date = self as Date
        return date.timeAgo()
    }
    
}
