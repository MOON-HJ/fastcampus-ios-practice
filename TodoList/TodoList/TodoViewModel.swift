//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 문효재 on 2020/10/30.
//

import Foundation

class TodoViewModel {
    let manager = TodoManager.shared
    
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String{
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }
    var numOfSection:Int { return Section.allCases.count }
    
    var todos:[Todo] { return manager.todos }
    var todayTodos:[Todo] {
        return todos.filter{ $0.isToday }
        
    }
    
    var upcommingTodos:[Todo] {
        return todos.filter{ !$0.isToday }
        
    }
    
    func addTodo(_ todo:Todo){
        manager.addTodo(todo)
    }
    
    func deleteTodo(_ todo:Todo){
        manager.deleteTodo(todo)
    }
    
    func updateTodo(_ todo:Todo){
        manager.updateTodo(todo)
    }
    
    func loadTasks() {
        manager.retrieveTodo()
    }
    
}
