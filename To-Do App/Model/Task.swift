//
//  Task.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import Foundation

enum TaskPriority: String {
    case normal
    case important
}

enum TaskStatus: Int {
    case planned
    case completed
}

protocol TaskProtocol {
    var title: String { get set }
    var type: TaskPriority { get set }
    var status: TaskStatus { get set }
}

struct Task: TaskProtocol {
    var title: String
    var type: TaskPriority
    var status: TaskStatus
}
