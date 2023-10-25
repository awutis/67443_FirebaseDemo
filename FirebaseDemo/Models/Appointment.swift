//
//  Appointment.swift
//  FirebaseDemo
//
//  Created by Annie Wu on 2023-10-24.
//

import Foundation
import FirebaseFirestoreSwift

struct Appointment: Identifiable, Comparable, Codable {
    
  // MARK: Fields
    @DocumentID var id: String?
    var attendee: String
    var category: String
    var coach: String
    var date: String
    var name: String
    var price: String
    var start_time: String
    
    
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case attendee
    case category
    case coach
    case date
    case name
    case price
    case start_time
  }
  
  // MARK: Comparable
  static func ==(lhs: Appointment, rhs: Appointment) -> Bool {
    return lhs.name == rhs.name
  }
  
  static func <(lhs: Appointment, rhs: Appointment) -> Bool {
    return lhs.name < rhs.name
  }
  
}
