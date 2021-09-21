//
//  ContentView.swift
//  CalendarApp
//
//  Created by Mert Çelik on 21.09.2021.
//

import SwiftUI

struct DateType {
    var Date: String
    var Day: String
    var Month: String
    var Year: String
}


struct ContentView: View {
    var body: some View {

        Home()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var date = Date()
    @State var data : DateType!
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack{
                if self.data != nil {
                    ZStack{
                        VStack(spacing:15) {
                            ZStack { // Month
                                HStack {
                                    Spacer()
                                    
                                    Text(self.data.Month)
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                }
                                .padding(.vertical)
                                
                                HStack {
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .month, value: -1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.left")
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                            }
                            .background(Color.red)
                            
                            ZStack {
                                VStack {
                                    Text(self.data.Date)
                                        .font(.system(size: 65))
                                        .fontWeight(.bold)
                                    
                                    Text(self.data.Day)
                                        .font(.title)
                                }
                                
                                HStack {
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.left")
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal, 30)
                            }
                            
                            Divider()
                            
                            ZStack { // Year
                                Text(self.data.Year)
                                    .font(.title)
                                
                                HStack {
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .year, value: -1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.left")
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .year, value: 1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                .foregroundColor(.black)
                                
                                .padding(.horizontal, 30)
                            }
                            .padding(.bottom, 12)
                        }
                        
                       
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 50)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .background(Color.black.opacity(0.06)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MMM-YYYYY"
            print(formatter.string(from: self.date))
        }
        )
        .onAppear {
            self.updateDate()
        }
        
  
    }
    
    
    func updateDate() {
        
        let current = Calendar.current
        
        let date = current.component(.day, from: self.date)
        let weakNo = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weakNo - 1]
        let monthNo = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNo - 1]
        let year = current.component(.year, from: self.date)
        
        
        self.data = DateType(Date: "\(date)", Day: day, Month: "\(month)", Year: "\(year)")
    }
}


