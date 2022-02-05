//
//  Database.swift
//  TooDoo
//
//  Created by Dustin Richardson on 1/19/22.
//
//  Description: This file will host items that are added to the TooDoo task list and act as a database.

// Import Functions
import Foundation // Default file import statement
import SwiftUI // Allows use of Swift UI
import Combine // Allows application page to communicate with main page

// Create structure to hold task items
struct Task: Identifiable {
    var id = String() // Unique ID
    var taskName = String() // Name of task item
    var taskDescription = String() // Description of task item
    var taskDate = Date() // Date of task item
}

// Task Database
class TaskDatabase {
    
    private static let myKey: String = "myKey" // Generate a private key called myKey
    
    // Set and Get information from local database UserDefaults
    public static var myValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey) // Set database
        }
        get {
            return UserDefaults.standard.string(forKey: myKey) ?? "" // Return the default database for myKey
        }
    }
    
    public static func removeValue() {
        UserDefaults.standard.removeObject(forKey: myKey)
    }
    
}
