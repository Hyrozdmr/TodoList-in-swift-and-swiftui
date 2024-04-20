//
//  TodoDisplayView.swift
//  TodoList
//
//  Created by Mustafa Hayri OZDEMIR on 12/04/2024.
//

//import SwiftUI
//
//struct TodoDisplayView: View {
//    var todos: String
//    
//    var body: some View {
//        Text("Todo: \(todos)")
//            .navigationBarTitle("Todo List")
//    }
//}


import SwiftUI

struct TodoDisplayView: View {
    var todo: TodoItem
    
    var body: some View {
        VStack {
            Text("Todo: \(todo.name)")
                .font(.title)
                .padding()
            
            // Add more detailed information or additional fields as needed
            Text("Completed: \(todo.isCompleted ? "Yes" : "No")")
                .padding()
        }
        .navigationBarTitle("Todo Detail")
    }
}
