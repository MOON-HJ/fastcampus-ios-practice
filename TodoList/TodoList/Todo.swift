//
//  Todo.swift
//  TodoList
//
//  Created by 문효재 on 2020/10/30.
//

import Foundation

struct Todo : Equatable{
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool){
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}



class TodoManager {
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos:[Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
            return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo){
        todos.append(todo)
        saveTodo()
    
    }
    
    func deleteTodo(_ todo: Todo){
        todos = todos.filter{$0.id != todo.id}
        saveTodo()
    
    }
    
    func updateTodo(_ todo: Todo){
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
        
    }
    
    func retrieveTodo(){
        
    }
    
    func saveTodo(){
        
        
    }
 }
