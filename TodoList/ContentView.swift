import SwiftUI

struct TodoItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var todo = ""
    @State private var todos = [TodoItem]()
    @State private var selectedTodo: TodoItem? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todoItem in
                    NavigationLink(
                        destination: TodoDetailView(todo: todoItem),
                        label: {
                            Text(todoItem.name)
                        }
                    )
                }
                Section(header: Text("Add a new todo")) {
                    VStack {
                        Image("todo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.accentColor)
                            .padding()
                    }
                    HStack {
                        TextField("Enter your todo", text: $todo)
                        Button("Submit") {
                            guard !todo.isEmpty else { return }
                            todos.append(TodoItem(name: todo, isCompleted: false))
                            todo = "" // Reset the text field
                        }
                    }
                }
                Section {
                    ForEach(todos.indices, id: \.self) { index in
                        Toggle(
                            isOn: self.$todos[index].isCompleted
                        ) {
                            Text(self.todos[index].name)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Todo List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}













//struct ContentView: View {
//    @State private var todo = ""
//    @State private var todos = [String]()  // Array to store todo list
//    
//    var body: some View {
//        NavigationView {
//            List {
//                // We're adding the TextField and Button to their own Section, with a header
//                Section(header: Text("Add a new todo")) {
//                    VStack {
//                        Image("todo")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.accentColor)
//                            .padding()
//                    }
//                
//                    // We're using HStack to stack the TextField and Button side by side
//                    HStack {
//                        TextField("Enter your todo", text: $todo)
//                        Button("Submit") {
//                            guard !todo.isEmpty else { return }
//                            todos.append(todo) // Add the new todo to the list
//                            todo = "" // Reset the text field
//                        }
//                    }
//                }
//                // The resulting list of todos should have their own Section
//                Section {
//                    // Cycle through the list of todos that have been submitted
//                    ForEach(todos, id: \.self) { todo in
//                        // For each todo, create a NavigationLink that connects to TodoDisplayView. The data that this NavigationLink should pass is the current todo
//                        NavigationLink(destination: TodoDisplayView(todos: todo)) {
//                            // This will be the part of our NavigationLink that the user will see: the todo displayed in the list
//                            Text(todo)
//                        }
//                    }
//                }
//            }
//            .navigationBarTitle("Todo List")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}







//struct TodoItem: Identifiable {
//    var id = UUID()
//    var name: String
//    var isCompleted: Bool
//}

//    @State private var todos = [
//        TodoItem(name: "Todo1", isCompleted: false),
//        TodoItem(name: "Todo2", isCompleted: false),
//        TodoItem(name: "Todo3", isCompleted: false),
//        TodoItem(name: "Todo4", isCompleted: false),
//        TodoItem(name: "Todo5", isCompleted: false)
//    ]
//        VStack {
//            Image("todo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.accentColor)
//                .padding()
//            HStack {
//                Text("Todos!")
//                    .font(.largeTitle)
//                Text("Toggle all of them off!")
//            }
//            
//            List(todos.indices, id: \.self) { index in
//                HStack {
//                    TextField("Enter Todo", text: self.$todos[index].name)
//                    Spacer()
//                    Toggle("", isOn: self.$todos[index].isCompleted)
//                }
//                .padding(.vertical, 8)
//            }
//            .padding()
//        }
//    }
//    
//    func index(for todo: TodoItem) -> Int {
//        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
//            return index
//        }
//        return 0
//    }
//}
