//
//  Today .swift
//  routineTick
//
//  Created by shaden  on 16/07/1445 AH.
//

import SwiftUI
import SwiftData

struct Today: View {
    @State private var time = Date()
    @State private var showCreate = false
    @State private var showQR = false
    
    @Query private var items: [NewTask]

    var body: some View {
        
        NavigationStack{
            ScrollView{
                HStack{
                    VStack(alignment: .center) {
                        // أيقونات الدوائر مع الخطوط العمودية
                        ForEach(0..<24) { index in
                            VStack(spacing: 10) {
                                Circle()
                                    .frame(width: 30, height: 20)
                                    .foregroundColor(colorForHour(index))
                                    .overlay(Circle().stroke(Color.darkPurple, lineWidth: 1))
                                
                                // خط طولي
                                if index < 23 {
                                    Spacer()
                                        .frame(width: 1.5, height: 59)
                                        .background(Color.mYellow)
                                }
                            }
                        }
                    }.padding(.trailing,20)
              
                    
                        .onAppear {
                            // بدء تحديث الوقت كل ثانية
                            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                time = Date()
                            }
                            // توقف التحديث عندما يتم إغلاق الشاشة
                            RunLoop.current.add(timer, forMode: .common)
                        }
                    ZStack{
                        ForEach(items) { item in
                            
                            Rectangle()
                                .foregroundColor(.white) // غيّر لون الخلفية إلى أبيض
                                .shadow(color: .gray, radius: 2, x: 6, y: 2)
                                .frame(width: 260, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.darkPurple, lineWidth: 1)
                                    
                                )
                            Text(item.titleName)
                                .padding(.bottom,40)
                                .padding(.trailing,120)
//                            Text(item.todaytime)
//                                .font(.body)
//                                .padding(.bottom,40)
//                                .padding(.leading,170)
//                                .foregroundColor(.gray)
                            Text(item.descr)
                                .padding(.top,40)
                                .padding(.trailing,120)
                                .foregroundColor(.gray)
                            Button{}label: {
                                Image(systemName: "checkmark")
                                    .symbolVariant(.circle.fill)
                                //        .foregroundStyle()
                                    .font(.title)
                                    .padding(.leading,200)
                                    .padding(.top,20)
                            }
                            
                            
                            
                            
                            
                        }
                  
                        
                        
                        
                    }
                }
            }
            
            
            Text("")
                .navigationTitle("Today")
                
                .toolbar{
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        Button(action:{showCreate.toggle()}){
                            Image(systemName: "qrcode")
                                .foregroundColor(Color.darkPurple)
                        }
                        Button(action: {showQR.toggle()}){
                            Image(systemName:"plus.app")
                                .foregroundColor(Color.darkPurple)
                        }.sheet(isPresented: $showCreate, content: {
                            NavigationStack{
                             TaskView()
                            }.presentationDetents([.large])
                        })
                    }
                    
                }
                           
            
        }
    }

    private func colorForHour(_ hour: Int) -> Color {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: time)

        if let currentHour = components.hour {
            // قم بتحديد لون الدائرة استنادًا إلى الساعة الحالية
            return currentHour == hour ? .darkPurple : .clear
        }

        return .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Today()
    }
}
