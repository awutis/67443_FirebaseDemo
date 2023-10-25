//
//  AppointmentView.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import Foundation
import SwiftUI

struct AppointmentView: View {
    
    // @EnvironmentObject var library: Library
    @ObservedObject var appointmentsViewModel = AppointmentsViewModel()
//    @ObservedObject var appointmentRepository = AppointmentRepository()
    
    
    var body: some View {
        let appointmentViewModels = appointmentsViewModel.appointmentViewModels.sorted(by: { $0.appointment < $1.appointment })
//        let appointments = appointmentRepository.appointments
        
        NavigationView{
            List{
                ForEach(appointmentViewModels) { appointmentViewModel in
                    AppointmentRowView(appointment: appointmentViewModel.appointment)
                }
            }.navigationBarTitle(Text("Appointments"))
            //        Text(appointmentViewModels[0].appointment.name)
        }
//        NavigationView {
//          List {
//            ForEach(appointments) { appointment in
//              AppointmentRowView(appointment: appointment)
//            }
//          }.navigationBarTitle("Appointments")
//        }
    }
}
