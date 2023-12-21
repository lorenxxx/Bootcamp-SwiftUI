//
//  CoreDataRelationshipBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/21.
//

import SwiftUI
import CoreData

struct CoreDataRelationshipBootcamp: View {
    
    @StateObject
    var vm = FirmCoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        //vm.addBusiness()
                        
                        //vm.updateBusiness()
                        
                        //vm.addDepartment()
                        
                        vm.deleteDeparment()
                        
                        //vm.addEmployee()
                        
                        //vm.getEmployees(forBusiness: vm.businesses[0])
                    }, label: {
                        Text("Perform Action")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    })
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(business: business)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                DepartmentView(department: department)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                                EmployeeView(employee: employee)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct BusinessView: View {
    
    let business: Business
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Business: \(business.name ?? "")")
                .bold()
            
            if let departments = business.departments?.allObjects as? [Department] {
                Text("Departments: ")
                    .bold()
                
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = business.employees?.allObjects as? [Employee] {
                Text("Employees: ")
                    .bold()
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10.0)
    }
}

struct DepartmentView: View {
    
    let department: Department
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Department: \(department.name ?? "")")
                .bold()
            
            if let businesses = department.businesses?.allObjects as? [Business] {
                Text("Business: ")
                    .bold()
                
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = department.employees?.allObjects as? [Employee] {
                Text("Employees: ")
                    .bold()
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(.green.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10.0)
    }
}

struct EmployeeView: View {
    
    let employee: Employee
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Employee: \(employee.name ?? "")")
                .bold()
            
            Text("Age: \(employee.age)")
            
            Text("DateJoined: \(employee.dataJoined ?? .now)")
            
            Text("Bussiness: ")
                .bold()
            
            Text("\(employee.business?.name ?? "")")
            
            Text("Department: ")
                .bold()
            
            Text("\(employee.department?.name ?? "")")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(.blue.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10.0)
    }
}

class FirmCoreDataManager {
    
    static let instance = FirmCoreDataManager()
    
    let container: NSPersistentContainer
    
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "FirmCoreDataContainer")
        container.loadPersistentStores { description, error in
            if let err = error {
                print("Error load core data. \(err)")
            } else {
                print("Successfully loaded core data.")
            }
        }
        
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Save successfully!")
        } catch let error {
            print("Error save core data. \(error)")
        }
    }
    
}

class FirmCoreDataRelationshipViewModel: ObservableObject {
    
    let manager = FirmCoreDataManager.instance
    
    @Published
    var businesses: [Business] = []
    
    @Published
    var departments: [Department] = []
    
    @Published
    var employees: [Employee] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<Business>(entityName: "Business")
    
        //let predicate = NSPredicate(format: "name == %@", "Apple")
        //request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(keyPath: \Business.name, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error get businesses. \(error)")
        }
    }
    
    func addBusiness() {
        let business = Business(context: manager.context)
        business.name = "Facebook"
        //business.departments = [departments[0], departments[1]]
        //business.employees = [employees[1]]
        
        save()
    }
    
    func updateBusiness() {
        let business = businesses[2]
        business.addToDepartments(departments[1])
        
        save()
    }
    
    func getDepartments() {
        let request = NSFetchRequest<Department>(entityName: "Department")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error get departments. \(error)")
        }
    }
    
    func addDepartment() {
        let department = Department(context: manager.context)
        department.name = "Finance"
        department.businesses = [businesses[0], businesses[1], businesses[2]]
        department.employees = [employees[1]]
        //department.addToEmployees(employees[1])
        
        save()
    }
    
    func deleteDeparment() {
        let department = departments[2]
        manager.context.delete(department)
        
        save()
    }
    
    func getEmployees() {
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error get employees. \(error)")
        }
    }
    
    func getEmployees(forBusiness business: Business) {
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        let predicate = NSPredicate(format: "business == %@", business)
        request.predicate = predicate
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error get employees. \(error)")
        }
    }
    
    func addEmployee() {
        let employee = Employee(context: manager.context)
        employee.name = "John"
        employee.age = 21
        employee.dataJoined = .now
        employee.business = businesses[2]
        employee.department = departments[1]
        
        save()
    }
    
    func save() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
    
}

#Preview {
    CoreDataRelationshipBootcamp()
}
