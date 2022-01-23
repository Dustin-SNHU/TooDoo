//
//  ContentView.swift
//  TooDoo
//
//  Created by Dustin Richardson on 1/11/22.
//

// Import statements
import SwiftUI
import Combine

// Main structure
struct ContentView: View {
    @ObservedObject var taskDatabase = TaskDatabase() // Retrieve list items
    @State var newTaskItem : String = "" // Updatable object for new task list item; will update as the user types into the textField
    
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
                textField.padding() // Makes button look nicer
                List {
                    ForEach(self.taskDatabase.tasks) {
                        task in Text(task.taskName)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }
                .navigationBarTitle("TooDoo") // Title element
                .navigationBarItems(trailing: EditButton()) // Edit button
            }
        }
    }
    // Move Function
    func move(from source: IndexSet, to destination: Int) {
        taskDatabase.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    // Delete function
    func delete(at offsets: IndexSet) {
        taskDatabase.tasks.remove(atOffsets: offsets)
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

