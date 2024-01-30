//
//  role.swift
//  routineTick
//
//  Created by Deemh Albaqami on 11/07/1445 AH.
//


import SwiftUI

struct RoleView: View {
    @State private var selectedRole: String? = nil

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
                
                Button(action: {
                    // Handle start action
                    if let selectedRole = selectedRole {
                        switch selectedRole {
                        case "maids":
                            // Navigate to MaidsView or perform action for maids
                            break
                        case "housewife":
                            // Navigate to HousewifeView or perform action for housewife
                            break
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
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}
