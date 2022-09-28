//
//  TaskStorage.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import Foundation

protocol TaskStoragable {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

class TasksStorage: TaskStoragable {
    func loadTasks() -> [TaskProtocol] {
        let testTasks: [TaskProtocol] = [
            Task(title: "Buy bread", type: .normal, status: .planned),
            Task(title: "Wash plates", type: .important, status: .planned),
            Task(title: "Return debt to Arnold", type: .important, status: .completed),
            Task(title: "Buy new vacuum", type: .normal, status: .completed),
            Task(title: "Buy flowers", type: .important, status: .planned),
            Task(title: "Call parents", type: .important, status: .planned),
        ]
        return testTasks.sorted { task1, task2 in
            task1.status.rawValue < task2.status.rawValue
        }
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {
        
    }
}
