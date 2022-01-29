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
    @State var newTaskItem: String = "" // Updatable object for new task list item; will update as the user types into the textField
    @State var newDescription: String = ""
    @State var newDate = Date()
    
    // textField structure
    var textField : some View {
        VStack {
            HStack {
                
                TextField("Enter Task Name", text: self.$newTaskItem)
                
                // Button to add new task items
                Button(action: self.addNewTask, label: {
                    Text("Add")
                    
                })
            }
            HStack {
                TextField("Description", text: self.$newDescription)
                    .font(Font.system(size: 12, design: .default))
                DatePicker("", selection: $newDate, displayedComponents: [.date])
            }
        }
    }
    
    // Function to add a new text item
    func addNewTask() {
        if newTaskItem != "" { // Check to see if there is any text in the textField
            taskDatabase.tasks.append(Task(id: String(taskDatabase.tasks.count + 1), taskName: newTaskItem, taskDescription: newDescription, taskDate: newDate))
            self.reset() // Resets all fields
        }
        else {
            self.reset() // Clear out text field
        }
        // Change to id field
    }
    
    // Task list array
    var body: some View {
        NavigationView {
            VStack {
                textField.padding() // Makes button look nicer
                List {
                    ForEach(self.taskDatabase.tasks) {
                        task in VStack {
                            Text(task.taskName)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(task.taskDescription)
                                .font(.system(size: 12, weight: .light, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            //Date(task.taskDate)
                        }
                    }
                    .onMove(perform: self.move)
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

    // Reset function; Clears out data
    func reset() {
        self.newTaskItem = ""
        self.newDescription = ""
        self.newDate = Date()
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

