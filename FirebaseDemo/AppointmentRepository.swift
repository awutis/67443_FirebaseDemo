//
//  AppointmentRepository.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class AppointmentRepository: ObservableObject {
    private let path: String = "Appointments"
    private let store = Firestore.firestore()
    
    @Published var appointments: [Appointment] = []
//    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.get()
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting appointments: \(error.localizedDescription)")
                    return
                }
                
                self.appointments = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Appointment.self)
                } ?? []
            }
//        var test = Appointment(name: "test")
//        self.appointments.append(test)
    }
    
    // MARK: CRUD methods
    func create(_ appointment: Appointment) {
      do {
        let newAppointment = appointment
        _ = try store.collection(path).addDocument(from: newAppointment)
      } catch {
        fatalError("Unable to add appointment: \(error.localizedDescription).")
      }
    }

    func update(_ appointment: Appointment) {
      guard let appointmentId = appointment.id else { return }
      
      do {
        try store.collection(path).document(appointmentId).setData(from: appointment)
      } catch {
        fatalError("Unable to update appointment: \(error.localizedDescription).")
      }
    }

    func delete(_ appointment: Appointment) {
      guard let appointmentId = appointment.id else { return }
      
      store.collection(path).document(appointmentId).delete { error in
        if let error = error {
          print("Unable to remove appointment: \(error.localizedDescription)")
        }
      }
    }
    
//    // MARK: Filtering methods
//    func getBooksFor(_ author: String) -> [Book] {
//      return self.books.filter{$0.author == author}
//    }
//    
//    func getFemaleAuthoredBooks() -> [Book] {
//      return self.books.filter{$0.gender == "Female"}
//    }
//    
//    func getMaleAuthoredBooks() -> [Book] {
//      return self.books.filter{$0.gender == "Male"}
//    }
    
  }
