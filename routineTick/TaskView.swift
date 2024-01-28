//
//  Task.swift
//  routineTick
//
//  Created by amal on 13/07/1445 AH.
//

import SwiftUI


struct TaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State var DatePickerR: Date = Date()
        let startingDate: Date = Calendar.current.date(from: DateComponents( month: 1, day: 1)) ?? Date()
        let endingDate : Date = Calendar.current.date(from: DateComponents( month: 6, day: 30)) ?? Date()
        @State var startTime: Date = Date()
        
        @State var endTime: Date = Date()
        @State var Tname = ""
        @State var Des = ""
        @State var isOn = false
    
  @State private var item  = NewTask()
    var body: some View {
        VStack {
                    Text("Task")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                            .alignmentGuide(.leading) { _ in 0 }
                    ZStack{

                        Rectangle()
                            .foregroundColor(.white)
                             .shadow( color: .gray, radius: 2, x: 8,y:3)
                            .frame(width: 350,height: 555)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 1))
                        Rectangle()
                            .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))

                            .frame(width: 350, height: 40)
                            .padding(.bottom,517)
                            .padding(.leading,2)
                            .cornerRadius(20)
                        Text("add new task")
                            .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { _ in 0 }
                                .padding(.bottom,500)
                                .padding(.leading,25)
                        TextField("Task Name..", text: $item.titleName)
                        .keyboardType(.alphabet)
                        .padding(.bottom,420)
                        .padding(.leading,25)
                        TextField("Task Description..", text: $item.descr)
                        .keyboardType(.alphabet)
                        .padding(.bottom,320)
                        .padding(.leading,25)
                        
                        DatePicker("Select a Date", selection: $item.todaytime, in: startingDate...endingDate ,
                                    displayedComponents: [.date])
                        .padding(.bottom,200)
                        .padding()
                        
                        DatePicker("Start", selection: $item.todaystart ,
                                   displayedComponents: .hourAndMinute)
                        .padding(.bottom,40)
                        .padding()
                        
                        DatePicker("End", selection: $item.todayend,                            displayedComponents: .hourAndMinute)
                            .padding(.top,100)
                            .padding()
                        
                        
                        Toggle(isOn: $isOn) {
                            Text("Daily Repeat:")
                        }
                        .padding(.top,280)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .purple))
                        
                        
                    
                    }
            HStack{
                Button("Cancel"){
                    withAnimation{
                        context.insert(item)
                    }
                }
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color(red: 0.941, green: 0.941, blue: 0.941))
                    .cornerRadius(5)

                NavigationLink(destination: role()) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.horizontal, 17)
                        .padding(.vertical, 5)
                        .background(Color(red: 0.539, green: 0.369, blue: 0.706))
                        .cornerRadius(5)
                }
                
            }
                

                }
                .padding()
    }
}

#Preview {
    TaskView()
        .modelContainer(for: NewTask.self)
}
