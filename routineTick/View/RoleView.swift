//
//  role.swift
//  routineTick
//
//  Created by Deemh Albaqami on 11/07/1445 AH.
//
import SwiftUI
import CloudKit

struct RoleView: View {
    @State private var selectedRole: String? = nil
    @State private var isActiveRuleView = false
    let container = CKContainer(identifier: "iCloud.routionTick_1")

    var body: some View {
        ZStack {
            Image("Imagebackground")
            
            VStack {
                Spacer()
                Image("RoleImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    
                Text("Select Your Role")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("Specify your role in the household. Are you the housewife managing tasks or the maid executing them?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack {
                    Button(action: {
                        selectRole("maids")
                    }) {
                        Text("Maids")
                            .foregroundColor(selectedRole == "maids" ? .white : .black)
                            .padding()
                            .background(selectedRole == "maids" ? Color("MainColor") : Color.gray.opacity(0.10))
                            .cornerRadius(40)
                    }
                    .padding()
                    
                    Button(action: {
                        selectRole("housewife")
                    }) {
                        Text("Housewife")
                            .foregroundColor(selectedRole == "housewife" ? .white : .black)
                            .padding()
                            .background(selectedRole == "housewife" ? Color("MainColor") : Color.gray.opacity(0.10))
                            .cornerRadius(40)
                    }
                }
                .padding()
                
                // NavigationLink to RuleView
                NavigationLink(
                    destination: RuleView(ruleManager: RuleManager(), isHousewife: selectedRole == "housewife"),
                    isActive: $isActiveRuleView
                ) {
                    EmptyView()
                }
                .hidden()
                
                // Button to trigger navigation
                Button(action: {
                    if let selectedRole = selectedRole {
                        saveRoleToCloudKit(role: selectedRole)
                        
                        switch selectedRole {
                        case "maids":
                            isActiveRuleView = true
                        case "housewife":
                            isActiveRuleView = true
                        default:
                            break
                        }
                    }
                }) {
                    Text("Start")
                        .padding()
                        .foregroundColor(.white)
                        .background(selectedRole != nil ? Color("MainColor") : Color("MainColor").opacity(0.5))
                        .cornerRadius(40)
                }
                .disabled(selectedRole == nil)
                
                Spacer()
            }
        }
    }

    private func selectRole(_ role: String) {
        if selectedRole == role {
            selectedRole = nil
        } else {
            selectedRole = role
        }
    }

    private func saveRoleToCloudKit(role: String) {
        let record = CKRecord(recordType: "UserRole")
        record["role"] = role as CKRecordValue

        container.privateCloudDatabase.save(record) { _, error in
            if let error = error {
                print("Error saving role to CloudKit: \(error.localizedDescription)")
            } else {
                print("done")
            }
        }
    }
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}

//
//import SwiftUI
//
//struct RoleView: View {
//    
//    @State private var selectedRole: String? = nil
//
//    var body: some View {
//        ZStack {
//            Image("Imagebackground")
//            
//            VStack {
//                Spacer()
//                Image("RoleImage")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 350, height: 350)
//                    
//                Text("Select Your Role")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
//                
//                Text("Specify your role in the household. Are you the housewife managing tasks or the maid executing them?")
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal)
//                
//                HStack {
//                    Button(action: {
//                        selectRole("maids")
//                    }) {
//                        Text("Maids")
//                            .foregroundColor(selectedRole == "maids" ? .white : .black)
//                            .padding()
//                            .background(selectedRole == "maids" ? Color("MainColor") : Color.gray.opacity(0.10))
//                            .cornerRadius(40)
//                        
//                        
//                    }
//                    .padding()
//                    
//                    Button(action: {
//                        selectRole("housewife")
//                    }) {
//                        Text("Housewife")
//                            .foregroundColor(selectedRole == "housewife" ? .white : .black)
//                            .padding()
//                            .background(selectedRole == "housewife" ? Color("MainColor") : Color.gray.opacity(0.10))
//                            .cornerRadius(40)
//                    }
//                }
//                .padding()
//                
//                Button(action: {
//                    // Handle start action
//                    if let selectedRole = selectedRole {
//                        switch selectedRole {
//                        case "maids":
//                            // Navigate to MaidsView or perform action for maids
//                            break
//                        case "housewife":
//                            // Navigate to HousewifeView or perform action for housewife
//                            break
//                        default:
//                            break
//                        }
//                    }
//                }) {
//                    Text("Start")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(selectedRole != nil ? Color("MainColor") : Color("MainColor").opacity(0.5))
//                        .cornerRadius(40)
//                }
//                .disabled(selectedRole == nil)
//                
//                Spacer()
//            }
//        }
//    }
//
//    private func selectRole(_ role: String) {
//        if selectedRole == role {
//            selectedRole = nil
//        } else {
//            selectedRole = role
//        }
//    }
//}
//
//struct RoleView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoleView()
//    }
//}
//
//
//import SwiftUI
//
//struct RoleView: View {
//    @EnvironmentObject private var roleManager: RoleManager
//    @State private var selectedRole: String? = nil
//
//    var body: some View {
//        ZStack {
//            Image("Imagebackground")
//            
//            VStack {
//                Spacer()
//                Image("RoleImage")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 350, height: 350)
//                    
//                Text("Select Your Role")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
//                
//                Text("Specify your role in the household. Are you the housewife managing tasks or the maid executing them?")
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal)
//                
//                HStack {
//                    Button(action: {
//                        selectRole("maids")
//                    }) {
//                        Text("Maids")
//                            .foregroundColor(selectedRole == "maids" ? .white : .black)
//                            .padding()
//                            .background(selectedRole == "maids" ? Color("MainColor") : Color.gray.opacity(0.10))
//                            .cornerRadius(40)
//                        
//                        
//                    }
//                    .padding()
//                    
//                    Button(action: {
//                        roleManager.selectedRole = "maids"
//                    }) {
//                        Text("Maids")
//                            .foregroundColor(roleManager.selectedRole == "maids" ? .white : .black)
//                            .padding()
//                            .background(roleManager.selectedRole == "maids" ? Color("MainColor") : Color.gray.opacity(0.10))
//                            .cornerRadius(40)
//                    }
//                    .padding()
//                    
//                    Button(action: {
//                        roleManager.selectedRole = "housewife"
//                    }) {
//                        Text("Housewife")
//                            .foregroundColor(roleManager.selectedRole == "housewife" ? .white : .black)
//                            .padding()
//                            .background(roleManager.selectedRole == "housewife" ? Color("MainColor") : Color.gray.opacity(0.10))
//                            .cornerRadius(40)
//                    }
//                    
//                
//                    Text("Start")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(selectedRole != nil ? Color("MainColor") : Color("MainColor").opacity(0.5))
//                        .cornerRadius(40)
//                }
//                .disabled(selectedRole == nil)
//                
//                Spacer()
//            }
//        }
//    }
//
//    private func selectRole(_ role: String) {
//        if selectedRole == role {
//            selectedRole = nil
//        } else {
//            selectedRole = role
//        }
//    }
//}
//class RoleManager: ObservableObject {
//    @Published var selectedRole: String? = nil
//}
//
//struct RoleView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoleView()
//    }
//}
