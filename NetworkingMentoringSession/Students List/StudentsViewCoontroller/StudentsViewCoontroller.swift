// 

import UIKit

final class StudentsViewCoontroller: UITableViewController {

    let viewModel = StudentsViewModel()
    var students: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")!
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = students[indexPath.row]
        let vc = SingleStudentViewController()
        vc.studentName = selectedStudent
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("DEINIT \(self)")
    }
}

final class StudentsViewModel {
    
    var studentsListLoaded: (([String]) -> Void)?
    
    func loadStudents() {
        studentsListLoaded?(["Student 1", "Student 2", "Student 3"])
    }
    
    deinit {
        print("DEINIT \(self)")
    }
}
