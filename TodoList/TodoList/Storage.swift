//
//  Storage.swift
//  TodoList
//
//  Created by 문효재 on 2020/10/30.
//

import Foundation

class Storage {
    private init(){}
    
    enum Directory {
        case documents
        case caches
        
        var url: URL {
            let path: FileManager.SearchPathDirectory
            switch self {
            case .documents:
                path = .documentDirectory
            case .caches:
                path = .cachesDirectory
            }
            return FileManager.default.urls(for: path, in: .userDomainMask).first!
        }
    }
}


extension Storage {
    static func saveTodo(_ obj: Todo, fileName: String){
        let url = Directory.documents.url.appendingPathComponent(fileName, isDirectory: false)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(obj)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch let error {
            dump("Failed to store msg = \(error.localizedDescription)")
        }
        
    }
    
    static func restoreTodo(_ fileName: String) -> Todo? {
        let url = Directory.documents.url.appendingPathComponent(fileName, isDirectory:  false)
        
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
        
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(Todo.self, from: data)
            return model
        } catch let error {
            dump("Failed to decode msg = \(error.localizedDescription)")
            return nil
        }
        
        
    }
}
