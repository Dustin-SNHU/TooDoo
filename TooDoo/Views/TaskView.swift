//
//  TaskView.swift
//  TooDoo
//
//  Created by Dustin Richardson on 1/29/22.
//

// Import Statements
import SwiftUI
import Combine

struct TaskView: View {
    
    @State var taskName: String = ""
    @State var description: String = ""
    @State var date = Date()
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Task Name", text: $taskName) // TextField to enter a new task item
                    .padding(.horizontal)
                    .frame(height: 50)
                    .cornerRadius(10)
                
                TextField("Description", text: $description) // TextField to enter a new task description
                    .padding(.horizontal)
                    .frame(height: 50)
                    .cornerRadius(10)
                
                DatePicker("Date", selection: $date) // DatePicker to enter a new date
                    .padding(.horizontal)
                    .frame(height: 50)
                    .cornerRadius(10)
                
                Button( action: {
                }, label: {
                        Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: 200)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        }
                )
            }
        }
        .navigationTitle("Add New Task")
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskView()

        }
    }
}
