//
//  RuleView.swift
//  routineTick
//
//  Created by Deemh Albaqami on 11/07/1445 AH.
//

import SwiftUI

struct Rule: Identifiable {
    var id = UUID()
    var content: String
}

class RuleManager: ObservableObject {
    @Published var rules: [Rule] = []

    func addRule(content: String) {
        rules.append(Rule(content: content))
    }

    func deleteRule(at index: IndexSet) {
        rules.remove(atOffsets: index)
    }

    func editRule(at index: Int, newContent: String) {
        rules[index].content = newContent
    }
}

struct RuleView: View {
    @State private var isAddingRule = false
    @State private var isEditingRule = false
    @State private var newRuleContent = ""
    @State private var editingRuleIndex: Int?
    
    @ObservedObject var ruleManager: RuleManager
    var isHousewife: Bool  // New boolean variable
    var editingAllowed: Bool {
        return isHousewife  // Use isHousewife to determine editing permissions
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(ruleManager.rules.indices, id: \.self) { index in
                    HStack {
                        Text(ruleManager.rules[index].content)
                        Spacer()
                        Button(action: {
                            editingRuleIndex = index
                            isEditingRule = true
                            newRuleContent = ruleManager.rules[index].content
                        }) {
                            Image(systemName: "pencil.circle")
                                .foregroundColor(Color("MainColor"))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete { indexSet in
                    if editingAllowed {
                        ruleManager.deleteRule(at: indexSet)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Rules")
            .toolbar {
                Button(action: {
                    if editingAllowed {
                        isAddingRule = true
                        editingRuleIndex = nil
                    }
                }) {
                    Label("Add Rule", systemImage: "plus.circle")
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(editingAllowed ? Color("MainColor") : .gray)
            }
        }
        .sheet(isPresented: $isAddingRule) {
            RuleEditorView(ruleManager: ruleManager, isAddingRule: $isAddingRule, newRuleContent: $newRuleContent, editingRuleIndex: editingRuleIndex, editingAllowed: editingAllowed)
        }
        .sheet(isPresented: $isEditingRule) {
            RuleEditorView(ruleManager: ruleManager, isAddingRule: $isEditingRule, newRuleContent: $newRuleContent, editingRuleIndex: editingRuleIndex, editingAllowed: editingAllowed)
        }
    }
}

struct RuleEditorView: View {
    @ObservedObject var ruleManager: RuleManager
    @Binding var isAddingRule: Bool
    @Binding var newRuleContent: String
    var editingRuleIndex: Int?
    var editingAllowed: Bool


    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Enter rule content", text: $newRuleContent)
                            .squareTextFieldStyle() // Apply custom square text field style
                        
                        if !newRuleContent.isEmpty {
                            Button(action: {
                                newRuleContent = ""
                            }) {
                                Image(systemName: "x.circle")
                                    .foregroundColor(Color("MainColor"))
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle(editingRuleIndex == nil ? "Add New Rule" : "Edit Rule")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isAddingRule = false
                        if let index = editingRuleIndex {
                            newRuleContent = ruleManager.rules[index].content
                        }
                    }
                    .foregroundColor(Color("MainColor"))
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(editingRuleIndex == nil ? "Add" : "Save") {
                        if let index = editingRuleIndex {
                            ruleManager.editRule(at: index, newContent: newRuleContent)
                        } else {
                            ruleManager.addRule(content: newRuleContent)
                        }
                        newRuleContent = ""
                        isAddingRule = false
                    }
                    .disabled(newRuleContent.isEmpty)
                    .foregroundColor(newRuleContent.isEmpty ? nil : Color("MainColor"))
                }
            }
        }
    }
}

struct SquareTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(PlainTextFieldStyle())
            .padding(10)
    }
}

extension TextField {
    func squareTextFieldStyle() -> some View {
        self.modifier(SquareTextFieldStyle())
    }
}

struct RuleView_Previews: PreviewProvider {
    static var previews: some View {
        let ruleManager = RuleManager()  // Create an instance of RuleManager
        RuleView(ruleManager: ruleManager, isHousewife: true)  // Provide values for ruleManager and editingAllowed
    }
}
//
//import SwiftUI
//
//struct Rule: Identifiable {
//    var id = UUID()
//    var content: String
//}
//
//class RuleManager: ObservableObject {
//    @Published var rules: [Rule] = []
//
//    func addRule(content: String) {
//        rules.append(Rule(content: content))
//    }
//
//    func deleteRule(at index: IndexSet) {
//        rules.remove(atOffsets: index)
//    }
//
//    func editRule(at index: Int, newContent: String) {
//        rules[index].content = newContent
//    }
//}
//
//struct RuleView: View {
//    @StateObject private var ruleManager = RuleManager()
//    @EnvironmentObject private var roleManager: RoleManager
//    
//    
//    //    @StateObject private var ruleManager = RuleManager()
//    @State private var isAddingRule = false
//    @State private var isEditingRule = false
//    @State private var newRuleContent = ""
//    @State private var editingRuleIndex: Int?
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(ruleManager.rules.indices, id: \.self) { index in
//                    HStack {
//                        Text(ruleManager.rules[index].content)
//                        Spacer()
//                        if roleManager.selectedRole == "housewife" {
//                            Button(action: {
//                                editingRuleIndex = index
//                                isEditingRule = true
//                                newRuleContent = ruleManager.rules[index].content
//                            }) {
//                                Image(systemName: "pencil.circle")
//                                    .foregroundColor(Color("MainColor"))
//                            }
//                            .buttonStyle(BorderlessButtonStyle())
//                        }
//                    }
//                }
//            }
//                //            List {
//                //                ForEach(ruleManager.rules.indices, id: \.self) { index in
//                //                    HStack {
//                //                        Text(ruleManager.rules[index].content)
//                //                        Spacer()
//                //                        Button(action: {
//                //                            editingRuleIndex = index
//                //                            isEditingRule = true
//                //                            newRuleContent = ruleManager.rules[index].content
//                //                        }) {
//                //                            Image(systemName: "pencil.circle")
//                //                                .foregroundColor(Color("MainColor"))
//                //                        }
//                //                        .buttonStyle(BorderlessButtonStyle())
//                //                    }
//                //                }
//                //                .onDelete { indexSet in
//                //                    ruleManager.deleteRule(at: indexSet)
//                //                }
//                //            }
//                .listStyle(SidebarListStyle())
//                .navigationTitle("Rules")
//                .toolbar {
//                    Button(action: {
//                        isAddingRule = true
//                        editingRuleIndex = nil
//                    }) {
//                        Label("Add Rule", systemImage: "plus.circle")
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .foregroundColor(Color("MainColor"))
//                }
//            }
//            .sheet(isPresented: $isAddingRule) {
//                RuleEditorView(ruleManager: ruleManager, isAddingRule: $isAddingRule, newRuleContent: $newRuleContent)
//            }
//            .sheet(isPresented: $isEditingRule) {
//                RuleEditorView(ruleManager: ruleManager, isAddingRule: $isEditingRule, newRuleContent: $newRuleContent, editingRuleIndex: editingRuleIndex)
//            }
//        }
//    }
//    
//    struct RuleEditorView: View {
//        
//        @ObservedObject var ruleManager: RuleManager
//        @Binding var isAddingRule: Bool
//        @Binding var newRuleContent: String
//        var editingRuleIndex: Int?
//        
//        var body: some View {
//            NavigationView {
//                Form {
//                    Section {
//                        HStack {
//                            TextField("Enter rule content", text: $newRuleContent)
//                                .squareTextFieldStyle()
//                            
//                            if !newRuleContent.isEmpty {
//                                Button(action: {
//                                    newRuleContent = ""
//                                }) {
//                                    Image(systemName: "x.circle")
//                                        .foregroundColor(Color("MainColor"))
//                                }
//                                .buttonStyle(BorderlessButtonStyle())
//                            }
//                        }
//                    }
//                }
//                .navigationTitle(editingRuleIndex == nil ? "Add New Rule" : "Edit Rule")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button("Cancel") {
//                            isAddingRule = false
//                            if let index = editingRuleIndex {
//                                newRuleContent = ruleManager.rules[index].content
//                            }
//                        }
//                        .foregroundColor(Color("MainColor"))
//                    }
//                    
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button(editingRuleIndex == nil ? "Add" : "Save") {
//                            if let index = editingRuleIndex {
//                                ruleManager.editRule(at: index, newContent: newRuleContent)
//                            } else {
//                                ruleManager.addRule(content: newRuleContent)
//                            }
//                            newRuleContent = ""
//                            isAddingRule = false
//                        }
//                        .disabled(newRuleContent.isEmpty)
//                        .foregroundColor(newRuleContent.isEmpty ? nil : Color("MainColor"))
//                    }
//                }
//            }
//        }
//    }
//    
//    struct SquareTextFieldStyle: ViewModifier {
//        func body(content: Content) -> some View {
//            content
//                .textFieldStyle(PlainTextFieldStyle())
//                .padding(10)
//        }
//    }
//    
//    extension TextField {
//        func squareTextFieldStyle() -> some View {
//            self.modifier(SquareTextFieldStyle())
//        }
//    }
//
//#Preview {
//    RuleView()
//}
