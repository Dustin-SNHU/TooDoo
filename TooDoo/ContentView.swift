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
            TextField("Enter Task Name",text:
                        self.$newTaskItem)
        }
    }
    
    // Task list array
    var body: some View {
        NavigationView {
            VStack {
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
        ContentView()
    }
}

