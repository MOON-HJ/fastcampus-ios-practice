

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
    
    func saveTodo(){
        
        
    }
 }
