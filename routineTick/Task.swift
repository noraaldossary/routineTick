//
//  Task.swift
//  routineTick
//
//  Created by amal on 13/07/1445 AH.
//

import SwiftUI

struct Task: View {
    @State var DatePickerR: Date = Date()
        let startingDate: Date = Calendar.current.date(from: DateComponents( month: 1, day: 1)) ?? Date()
        let endingDate : Date = Calendar.current.date(from: DateComponents( month: 6, day: 30)) ?? Date()
        @State var startTime: Date = Date()
        
        @State var endTime: Date = Date()
        @State var Tname = ""
        @State var Des = ""
        @State var isOn = false
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
                        
                        Text("add new task")
                            .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { _ in 0 }
                                .padding(.bottom,500)
                                .padding(.leading,25)
                        TextField("Task Name..", text: $Tname)
                        .keyboardType(.alphabet)
                        .padding(.bottom,420)
                        .padding(.leading,25)
                        TextField("Task Description..", text: $Des)
                        .keyboardType(.alphabet)
                        .padding(.bottom,320)
                        .padding(.leading,25)
                        
                        DatePicker("Select a Date", selection: $DatePickerR, in: startingDate...endingDate ,
                                    displayedComponents: [.date])
                        .padding(.bottom,200)
                        .padding()
                        
                        DatePicker("Start", selection: $startTime ,
                                   displayedComponents: .hourAndMinute)
                        .padding(.bottom,40)
                        .padding()
                        
                        DatePicker("End", selection: $endTime,                            displayedComponents: .hourAndMinute)
                            .padding(.top,100)
                            .padding()
                        
                        
                        Toggle(isOn: $isOn) {
                            Text("Daily Repeat:")
                        }
                        .padding(.top,280)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .purple))
                        
                        
                    
                    }
                    
                

                }
                .padding()
    }
}

#Preview {
    Task()
}
