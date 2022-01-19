//
//  ContentView.swift
//  TooDoo
//
//  Created by Dustin Richardson on 1/11/22.
//

import SwiftUI

// Main structure
struct ContentView: View {
    @ObservedObject var taskDatabase = TaskDatabase() // Retrieve list items
    @State var newTaskItem : String = "" // Updatable object for new task list item
    
    // textField structure
    var textField : some View {
        HStack {
            TextField("Enter Task Name",text: self.$newTaskItem)
            // Button to add new task items
            Button(action: self.addNewTask, label: {
                Text("New")
            })
        }
    }
    
    // Function to add a new text item
    func addNewTask() {
        taskDatabase.tasks.append(Task(id: String(taskDatabase.tasks.count + 1), taskName: newTaskItem))
        self.newTaskItem = "" // Clear out text field after adding new item
        
        // Change to id field
    }
    
    // Task list array
    var body: some View {
        NavigationView {
            VStack {
                textField.padding()
                List(self.taskDatabase.tasks) {
                    task in Text(task.taskName) // Pull task names
                }
                .navigationBarTitle("TooDoo") // Title element
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

