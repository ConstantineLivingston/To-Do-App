//
//  TaskListController.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import UIKit

class TaskListController: UITableViewController {
    
    private let tasksStorage: TaskStoragable = TasksStorage()
    private var tasks: [TaskPriority: [TaskProtocol]] = [:]
    
    private let sectionsTypesPosition: [TaskPriority] = [.important, .normal]
    private let tasksStatusPosition: [TaskStatus] = [.planned, .completed]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        loadTasksFromStorage()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let taskType = sectionsTypesPosition[section]
        
        guard let currentTasksType = tasks[taskType] else { return 0 }
        return currentTasksType.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        getConfiguredTaskCell(for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = sectionsTypesPosition[section].rawValue
        return title
    }
    
    
}

extension TaskListController {
    private func configureTableView() {
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.identifier)
    }
    
    private func sortTasksByStatus() {
        for (tasksGroupPriority, _) in tasks {
            tasks[tasksGroupPriority]?.sort { task1, task2 in
                let task1Position = tasksStatusPosition.firstIndex(of: task1.status) ?? 0
                let task2Position = tasksStatusPosition.firstIndex(of: task2.status) ?? 0
                return task1Position < task2Position
            }
        }
    }
    
    private func loadTasksFromStorage() {
        sectionsTypesPosition.forEach { taskType in
            tasks[taskType] = []
        }
        
        tasksStorage.loadTasksWithCompletion { [weak self] loadedTasks in
            guard let self = self else { return }
            
            loadedTasks.forEach { task in
                self.tasks[task.type]?.append(task)
                self.sortTasksByStatus()
                self.tableView.reloadData()
            }
        }
    }
    
    private func getConfiguredTaskCell(for indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell
        else { fatalError("Couldn't dequeue TaskCell") }
        
        let taskType = sectionsTypesPosition[indexPath.section]
        guard let currentTask = tasks[taskType]?[indexPath.row] else { return cell }
        
        let taskViewModel = TaskViewModel(task: currentTask)
        cell.taskViewModel = taskViewModel
        
        return cell
    }
}
