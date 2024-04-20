//
//  TodoDetailView.swift
//  TodoList
//
//  Created by Mustafa Hayri OZDEMIR on 12/04/2024.
//


import SwiftUI

struct TodoDetailView: View {
    var todo: TodoItem
    
    var body: some View {
        VStack {
            Text("Detailed Description for \(todo.name)")
                .font(.title)
                .padding()
            
            // Add more detailed description or additional fields as needed
            
            Spacer()
        }
        .navigationBarTitle("ToDo Detail")
    }
}

