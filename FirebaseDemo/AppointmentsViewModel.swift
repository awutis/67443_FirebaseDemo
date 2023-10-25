//
//  AppointmentsViewModel.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import Foundation
import Combine

class AppointmentsViewModel: ObservableObject {
  @Published var appointmentViewModels: [AppointmentViewModel] = []
  private var cancellables: Set<AnyCancellable> = []

  @Published var appointmentRepository = AppointmentRepository()
  @Published var appointments: [Appointment] = []
  
  init() {
    appointmentRepository.$appointments.map { appointments in
      appointments.map(AppointmentViewModel.init)
    }
    .assign(to: \.appointmentViewModels, on: self)
    .store(in: &cancellables)
  }

//  func add(_ book: Book) {
//    bookRepository.create(book)
//  }
//  
//  func destroy(_ book: Book) {
//    bookRepository.delete(book)
//  }
  
}
