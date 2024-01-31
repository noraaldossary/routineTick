//
//  Onboarding.swift
//  routineTick
//
//  Created by Deemh Albaqami on 11/07/1445 AH.
//

import SwiftUI

struct OnboardingView: View {
    let onboardingData = [
        OnboardingItem(imageName: "image1", title: "Hi there !", description: "Welcome to RoutineTick, your personal assistant for seamless communication between housewives and maids."),
        OnboardingItem(imageName: "image2", title: "Assign Tasks", description: "Set the household tasks that matter to you. Customize your task list to align with your daily routine."),
        OnboardingItem(imageName: "image3", title: "Make a Schedule", description: "Craft a schedule that suits your lifestyle. Define when tasks should be completed, ensuring clear instructions."),
        OnboardingItem(imageName: "image4", title: "Track Easily", description: "Stay informed about completed tasks, receive updates, and maintain clear communication for a harmonious home environment.")
        
    ]
    
    @State private var currentPage: Int = 0
    var totalPage = 4
    var body: some View {
        NavigationView {
            ZStack {
                Image("Imagebackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Button(action: {
                            currentPage = 4
                        })
                        
                        {
                            Text("Skip")
                                .foregroundColor(.gray)
                                .kerning(1.5)
                        }
                        .padding()
                        Spacer()
                        
                    }
                    TabView(selection: $currentPage) {
                        ForEach(0..<onboardingData.count) { index in
                            OnboardingScreen(onboardingItem: onboardingData[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                }
                VStack {
                    Spacer()
                    
                    HStack {
                        NavigationLink(
                            destination: RoleView(),
                            isActive: Binding(
                                get: {currentPage >= totalPage},
                                set: { _ in }
                            ),
                            label: {
                                EmptyView()
                            }
                        )
                        
                        Button(action: {
                            if currentPage < totalPage {
                                currentPage += 1
                            }
                        }) {
                            
                            if currentPage == 3 {
                                Text("Get Started!")
                                    .kerning(1.5)
                                    .frame(minWidth:0, maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color("MainColor"))
                                    .cornerRadius(40)
                                    .padding(.horizontal, 16)
                            }
                            else {
                                Text("Next")
                                    .kerning(1.5)
                                    .frame(minWidth:0, maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color("MainColor"))
                                    .cornerRadius(40)
                                    .padding(.horizontal, 16)
                            }
                            
                        }
                        .padding()
                    }
                    .padding()
                    
                }
                .padding()
            }
            
        }
        
        
    }
    
    
    
    struct OnboardingScreen: View {
        let onboardingItem: OnboardingItem
        
        var body: some View {
            VStack {
                Image(onboardingItem.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()
                
                Text(onboardingItem.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(onboardingItem.description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            }
            .padding()
        }
    }
    
    struct OnboardingItem {
        let imageName: String
        let title: String
        let description: String
    }
    
    @main
    struct OnboardingApp: App {
        var body: some Scene {
            WindowGroup {
                OnboardingView()
            }
        }
    }
}
#Preview {
    OnboardingView()
}

