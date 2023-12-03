//
//  TimeSinceCreated.swift
//  GVCourses
//
//  Created by Minh Tran on 24/10/2023.
//

import Foundation

// Function to format the time duration
func formatTimeSinceCreated(createdAt: Date) -> String {
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: createdAt, to: now)
    
    if let year = components.year, year > 0 {
        return formatDuration(year, unit: "year")
    } else if let month = components.month, month > 0 {
        return formatDuration(month, unit: "month")
    } else if let day = components.day, day > 0 {
        return formatDuration(day, unit: "day")
    } else if let hour = components.hour, hour > 0 {
        return formatDuration(hour, unit: "hour")
    } else if let minute = components.minute, minute > 0 {
        return formatDuration(minute, unit: "minute")
    } else if let second = components.second {
        return formatDuration(second, unit: "second")
    } else {
        return "Just now"
    }
}

func formatDuration(_ value: Int, unit: String) -> String {
    if value == 1 {
        return "\(value) \(unit) ago"
    } else {
        return "\(value) \(unit)s ago"
    }
}
