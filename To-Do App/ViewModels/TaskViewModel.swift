//
//  TaskViewModel.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import Foundation
import UIKit

struct TaskViewModel {
    var symbol: String
    let title: String
    let labelColor: UIColor
    
    //Dependency Injection
    init(task: TaskProtocol) {
        self.title = task.title
        
        switch task.status {
        case .planned:
            self.symbol = "\u{25CB}"
            self.labelColor = .black
        case .completed:
            self.symbol = "\u{25C9}"
            self.labelColor = .lightGray
        }
    }
}
