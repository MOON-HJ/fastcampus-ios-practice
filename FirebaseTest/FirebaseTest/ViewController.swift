//
//  ViewController.swift
//  FirebaseTest
//
//  Created by 문효재 on 2021/01/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var countCustomersLabel: UILabel!
    
    let db  = Database.database().reference()
    var customers: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabel()
        saveBasicTypes()
//        saveCustomers()
        fetchCustomers()
        updateBasicTypes()
//        deleteBasicTypes()
    }
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func readCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomers()
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomers()
    }
    
    
    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? String ?? ""
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        })
        
    }
}

extension ViewController {
    func updateBasicTypes(){
        db.updateChildValues(["int" : 23])
        db.updateChildValues(["double" : 14.5])
        db.updateChildValues(["str" : "hello world !!!!!"])

    }
    
    func deleteBasicTypes(){
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("str").removeValue()
    }
}


extension ViewController {
    func saveBasicTypes(){
        // - string, number, dict, array
        
        db.child("int").setValue(3)
        db.child("double").setValue(4.5)
        db.child("str").setValue("hello world")
        db.child("array").setValue(["a", "b", "c"])
        db.child("dict").setValue(["id":"anyID", "age":10, "city":"seoul"])
    }
    
    func saveCustomers() {
        let books = [Book(title: "Good to Great", author: "Someone"),
                     Book(title: "Hacking Growth", author: "Somebody")]
        
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        let customer2 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
        Customer.id += 1
        let customer3 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
        Customer.id += 1
        
        db.child("customers").child(customer1.id).setValue(customer1.toDicionary)
        db.child("customers").child(customer2.id).setValue(customer2.toDicionary)
        db.child("customers").child(customer3.id).setValue(customer3.toDicionary)

    }
}

extension ViewController {
    func fetchCustomers(){
        db.child("customers").observeSingleEvent(of: .value){ (snapshot) in
            print("\(snapshot.value)")
            do{
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let customers:[Customer] = try decoder.decode([Customer].self, from: data)
                self.customers = customers
                DispatchQueue.main.async {
                    self.countCustomersLabel.text = "# of Customers: \(customers.count)"
                }
                print("customers : \(customers)")
            } catch let error{
                print("\(error.localizedDescription)")
                
            }
            
        }
    }
    
    
    func updateCustomers(){
        guard !customers.isEmpty else {
            return
        }
        
        customers[0].name = "Moon"
        
        let dictionary = customers.map{ $0.toDicionary }
        db.updateChildValues(["customers" : dictionary])
    
        
    }
    
    func deleteCustomers(){
        db.child("customers").removeValue()
        
    }
}

struct Customer: Codable{
    var id: String
    var name:String
    var books: [Book]
    
    var toDicionary:[String:Any] {
        let booksArray = books.map{$0.toDicionary}
        let dict: [String:Any] = ["id":id, "name":name, "books":booksArray]
        
        return dict
    }
    
    static var id : Int = 0
    
  
}
struct Book: Codable {
    let title: String
    let author:String
    
    var toDicionary:[String:Any] {
        let dict: [String:Any] = ["title":title, "author":author]
        
        return dict
    }
}
