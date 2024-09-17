//
//  SettingView.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import SwiftUI

struct SettingView: View {
    @State var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "alarm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 40, height: 40)
                    .padding()
                
                Text("Schedule Your Notifications")
                    .font(.headline)
                
                Button("Send notification in 1 Hour") {
                    notify.sendNotification(
                        date: Date(),
                        type: "time",
                        timeInterval: 3600,
                        title: "1 Hour notification",
                        body: "You can write more in here!")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                NotificationSchedulerView(selectedDate: $selectedDate, notify: notify)
                
                Spacer()
                
                Text("Need Help?")
                    .foregroundColor(.gray)
                    .italic()
                
                Button("Request permissions") {
                    notify.askPermission()
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
            .padding()
        }
    }
}

struct NotificationSchedulerView: View {
    @Binding var selectedDate: Date
    let notify: NotificationHandler
    
    var body: some View {
        VStack(spacing: 10) {
            DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
                .datePickerStyle(.graphical)
            
            Button("Schedule notification") {
                notify.sendNotification(
                    date: selectedDate,
                    type: "date",
                    title: "OnTime(ToDoList)",
                    body: "This is a reminder that you have an upcoming task. Tap on the notification to see more.")
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
