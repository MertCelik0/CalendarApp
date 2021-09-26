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
        NavigationView {
            Home()
            .navigationTitle("Islamic Calendar")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    @State var date = Date()
    @State var GregorianDateDdata : DateType!
    @State var selectedDateData : DateType!
    
    var body: some View {

            GeometryReader{ geometry in
                ScrollView {

                    HStack{
                                        
                        if self.GregorianDateDdata != nil {
                            
                            // FIRST CALENDAR
                            
                            ZStack{
                                VStack {
                                    ZStack { // Month
                                        HStack {
                                            Spacer()
                                            
                                            Text(self.GregorianDateDdata.Month)
                                                .font(.subheadline)
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
                                                    .font(.subheadline)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.right")
                                                    .font(.subheadline)
                                            }
                                        }
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                    }
                                    .background(Color.red)
                                    
                                    ZStack {
                                        VStack {
                                            Text(self.GregorianDateDdata.Date)
                                                .font(.system(size: 45))
                                                .fontWeight(.bold)
                                            
                                            Text(self.GregorianDateDdata.Day)
                                                .font(.subheadline)
                                        }
                                        
                                        HStack {
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.left")
                                                    .font(.subheadline)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.right")
                                                    .font(.subheadline)
                                            }
                                        }
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 10)
                                    }
                                    
                                    Divider()
                                    
                                    ZStack { // Year
                                        Text(self.GregorianDateDdata.Year)
                                            .font(.subheadline)
                                        
                                        HStack {
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .year, value: -1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.left")
                                                    .font(.subheadline)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .year, value: 1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.right")
                                                    .font(.subheadline)
                                            }
                                        }
                                        .foregroundColor(.black)
                                        
                                        .padding(.horizontal, 10)
                                    }
                                    .padding(.bottom, 12)
                                }
                                
                            }
                            .background(Color.white)
                            .cornerRadius(15)
//                            .padding(.horizontal, 50)
                            .padding()
//                            Divider()
//
                            Text(">>>")

//                            Divider()
                            
                            // SELECTED CALENDAR
                            
                            ZStack{
                                VStack {
                                    ZStack { // Month
                                        HStack {
                                            Spacer()
                                            
                                            Text(self.selectedDateData.Month)
                                                .font(.subheadline)
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
                                                    .font(.subheadline)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.right")
                                                    .font(.subheadline)
                                            }
                                        }
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                    }
                                    .background(Color.black)
                                    
                                    ZStack {
                                        VStack {
                                            Text(self.selectedDateData.Date)
                                                .font(.system(size: 45))
                                                .fontWeight(.bold)
                                            
                                            Text(self.selectedDateData.Day)
                                                .font(.subheadline)
                                        }
                                        
                                        HStack {
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.left")
                                                    .font(.subheadline)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.right")
                                                    .font(.subheadline)
                                            }
                                        }
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 10)
                                    }
                                    
                                    Divider()
                                    
                                    ZStack { // Year
                                        Text(self.selectedDateData.Year)
                                            .font(.subheadline)
                                        
                                        HStack {
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .year, value: -1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.left") .font(.subheadline)
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                self.date = Calendar.current.date(byAdding: .year, value: 1, to: self.date)!
                                                
                                                self.updateDate()
                                            }) {
                                                Image(systemName: "arrow.right")
                                                    .font(.subheadline)
                                            }
                                        }
                                        .foregroundColor(.black)
                                        
                                        .padding(.horizontal, 10)
                                    }
                                    .padding(.bottom, 12)
                                }
                                
                            }
                            .background(Color.white)
                            .cornerRadius(15)
//                            .padding(.horizontal, 50)
                            .padding()
                        }
                    }
//                    .frame(width: geometry.size.width)
//                    .padding(.top, 30)
                
                }
                
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
        
        
                        
        let dateFor = DateFormatter()

         let hijriCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
         dateFor.locale = Locale.init(identifier: "ar") // or "en" as you want to show numbers

         dateFor.calendar = hijriCalendar

        let datecurrent = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
        
        let Selecteddate = datecurrent.component(.day, from: self.date)
        let SelectedweakNo = datecurrent.component(.weekday, from: self.date)
        let Selectedday = current.weekdaySymbols[SelectedweakNo - 1]
        let SelectedmonthNo = datecurrent.component(.month, from: self.date)
        let Selectedmonth = datecurrent.monthSymbols[SelectedmonthNo - 1]
        let Selectedyear = datecurrent.component(.year, from: self.date)
        
        self.GregorianDateDdata = DateType(Date: "\(date)", Day: day, Month: "\(month)", Year: "\(year)")
        
        
        self.selectedDateData = DateType(Date: "\(Selecteddate)", Day: Selectedday, Month: "\(Selectedmonth)", Year: "\(Selectedyear)")
        
        
    }
}


