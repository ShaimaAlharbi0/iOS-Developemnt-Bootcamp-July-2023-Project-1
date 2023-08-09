//
//  ContentView.swift
//  MyTasks
//
//  Created by Shaima Alharbi on 17/01/1445 AH.
//

import SwiftUI

enum TaskPriorityEnum  : String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }

    case low = "LOW"
    case medium = "MEDIUM"
    case high = "HIGH"
}


//View for Insert New Task
struct NewTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var prioritySelection = "LOW"
    @State private var statusSelection = "Backlog"
    let taskPriorityList = ["LOW", "MEDIUM", "HIGH"]
    let taskStatusList = ["Backlog", "ToDo", "In-Progress", "Done"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 230){
                    VStack {
                        Button("<") {
                            dismiss()
                        }
                        .font(.system(size: 30))
                    }
                    
                    HStack{
                        Text("New Tasks")
                            .fontWeight(.black)
                            .font(.system(size: 20))
                    }
                }
                .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                
                VStack{
                    HStack{
                        TextField(
                            "Title",
                            text: $taskTitle
                        )
                        .disableAutocorrection(true)
                    }
                    
                    HStack{
                        TextField(
                            "Description",
                            text: $taskDescription
                        )
                        .disableAutocorrection(true)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack(alignment: .center, spacing: 100) {
                        Picker("Priority", selection: $prioritySelection) {
                            ForEach(taskPriorityList, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.5))
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack(alignment: .center, spacing: 100) {
                        Text("Status")
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity(0.5))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    HStack(alignment: .center) {
                        Picker("Select Task Status", selection: $statusSelection) {
                            ForEach(taskStatusList, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(Color(red: 0.8, green: 0.625, blue: 0.469).opacity(0.2))
                    }
                }
                .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                Button("plus") {
                }
                .padding(.vertical, 17)
                .padding(.horizontal, 120)
                .background(Color(red: 0.8, green: 0.625, blue: 0.469).opacity(0.8))
                .cornerRadius(12)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            }
            .background(Image("IslamicBackground"))
            .padding()
        }
    }
}

//View for Edit or Delete a Task
struct TaskDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var prioritySelection = "LOW"
    @State private var statusSelection = "Backlog"
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    let taskPriorityList = ["LOW", "MEDIUM", "HIGH"]
    let taskStatusList = ["Backlog", "ToDo", "In-Progress", "Done"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 280){
                    VStack {
                        Button("<") {
                            dismiss()
                        }
                        .font(.system(size: 30))
                    }
                    
                    HStack{
                        Button{
                        }
                    label: {
                        Image("icons8-edit-50")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                    }
                        
                        Button{
                            alertMessage = "Are you sure to delete the task?"
                            showAlert = true
                            showingSheet.toggle()
                        }
                    label: {
                        Image("icons8-delete-50")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                            .frame(width: 25.0, height: 25.0)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(alertMessage))
                    }
                    }
                }
                .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                
                VStack{
                    HStack{
                        TextField(
                            "Title",
                            text: $taskTitle
                        )
                        .disableAutocorrection(true)
                    }
                    
                    HStack{
                        TextField(
                            "Description",
                            text: $taskDescription
                        )
                        .disableAutocorrection(true)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack(alignment: .center, spacing: 100) {
                        Picker("Priority", selection: $prioritySelection) {
                            ForEach(taskPriorityList, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.5))
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack(alignment: .center, spacing: 100) {
                        Text("Status")
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity(0.5))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    HStack(alignment: .center) {
                        Picker("Select Task Status", selection: $statusSelection) {
                            ForEach(taskStatusList, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(Color(red: 0.8, green: 0.625, blue: 0.469).opacity(0.2))
                    }
                }
                .textFieldStyle(.roundedBorder)
                
                Spacer()
            }
            
            
            .background(Image("IslamicBackground"))
            .padding()
        }
    }
}


struct ContentView: View {
    @State var searchedText: String = ""
    @State private var showingTaskSheet = false
    @State private var showingDetailsSheet = false
    @State private var noTask = false
    @AppStorage("TaskTitle") var saveTaskTitle = ""
    @AppStorage("TaskDescription") var saveTaskDescription = ""
    @AppStorage("TaskPriority") var saveTaskPriority = ""
    @AppStorage("TaskStatus") var saveTaskStatus = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 170){
                    VStack{
                        Text("My Tasks")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                    }
                    
                    HStack{
                        Button{
                        }
                    label: {
                        Image("icons8-filter-50")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                    }
                        
                        Button{
                            showingTaskSheet.toggle()
                        }
                    label: {
                        Image("icons8-plus-50")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                            .frame(width: 25.0, height: 25.0)
                            .sheet(isPresented: $showingTaskSheet) {
                                NewTaskView()
                            }
                    }
                    }
                }
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchedText)
                        .frame(height: 40)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                
                HStack{
                    if noTask{
                        List {
                            Text("No Tasks")
                        }
                        .listStyle(GroupedListStyle())
                        .scrollContentBackground(.hidden)
                        .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                    }
                    else{
                        List {
                            Button{
                                showingDetailsSheet.toggle()
                            }
                        label: {
                            Text("Item 1")
                                .sheet(isPresented: $showingDetailsSheet) {
                                    TaskDetailsView()
                                }
                        }
                        }
                        .listStyle(GroupedListStyle())
                        .scrollContentBackground(.hidden)
                        .foregroundColor(Color(red: 0.8, green: 0.625, blue: 0.469))
                    }
                }
            }
            .background(Image("IslamicBackground"))
        }
        .padding()
        .background(Image("IslamicBackground"))
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
