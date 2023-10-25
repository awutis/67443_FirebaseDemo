//
//  AppointmentDetailsView.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import SwiftUI

struct AppointmentDetailsView: View {
  var appointment: Appointment
  
  var body: some View {
    VStack {
      Text(appointment.name)
        .font(.title)
        .fontWeight(.black)
        .padding([.top], 40)
      Text("Attendee:  \(appointment.attendee)")
        .font(.title3)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .padding(5)
      Text("Coach: \(appointment.coach)")
        .font(.title3)
        .fontWeight(.bold)
        .padding(20)
      Text("Date: \(appointment.date)")
        .font(.headline)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(.secondary)
        .padding(20)
      Text("Start time: \(appointment.start_time)")
        .font(.headline)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(.secondary)
        .padding(20)
      Text("Category: \(appointment.category)")
        .font(.headline)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(.secondary)
        .padding(20)
      Text("Price: $ \(appointment.price)")
        .font(.title3)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .padding(20)
    }.navigationBarTitle(Text("Appointment Details"), displayMode: .inline)
    
    Spacer()  // To force the content to the top
  }
}
