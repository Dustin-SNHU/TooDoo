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
    //hold for date field
}

// Create Database ObservableObject to store task items 
class TaskDatabase : ObservableObject {
    @Published var tasks = [Task]()
}
