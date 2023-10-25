//
//  ViewModel.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import Foundation
import Combine

class AppointmentViewModel: ObservableObject, Identifiable {
    
    private let appointmentRepository = AppointmentRepository()
    @Published var appointment: Appointment
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    
    init(appointment: Appointment) {
        self.appointment = appointment
        $appointment
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func update(appointment: Appointment) {
      appointmentRepository.update(appointment)
    }

    func destroy(appointment: Appointment) {
      appointmentRepository.delete(appointment)
    }
}
    
  
