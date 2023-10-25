//
//  AppointmentRowView.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import SwiftUI

struct AppointmentRowView: View {
  var appointment: Appointment
  
  var body: some View {
      NavigationLink(
        destination: AppointmentDetailsView(appointment: appointment),
        label: {
          Text(appointment.name)
            .fontWeight(.bold)
            .font(.body)
        })
  }
}
