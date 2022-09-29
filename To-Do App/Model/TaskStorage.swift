//
//  TaskStorage.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import Foundation

typealias Tasks = [TaskProtocol]

protocol TaskStoragable {
    func loadTasksWithCompletion(_ completion: @escaping ((Tasks) -> Void))
    func saveTasks(_ tasks: Tasks)
}

class TasksStorage: TaskStoragable {
    func loadTasksWithCompletion(_ completion: @escaping ((Tasks) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).async {
            let testTasks: Tasks = [
                Task(title: "Buy bread", type: .normal, status: .planned),
                Task(title: "Wash plates", type: .important, status: .planned),
                Task(title: "Return debt to Arnold", type: .important, status: .completed),
                Task(title: "Buy new vacuum", type: .normal, status: .completed),
                Task(title: "Buy flowers", type: .important, status: .planned),
                Task(title: "Send invitation to the party to Dolph, Jackie, Leonardo, Will and Bruce", type: .important, status: .planned),
                Task(title: "Call parents", type: .important, status: .planned),
            ]
            DispatchQueue.main.async {
                completion(testTasks)
            }
        }
    }
    
    func saveTasks(_ tasks: Tasks) {
        
    }
}
