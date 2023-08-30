//
//  TableViewController.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 2023-08-29.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let students = Student.getStudents()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! TableCellTableViewCell
        cell.img.image = students[indexPath.item].imagePath
        cell.name.text = students[indexPath.item].name
        cell.emailLabel.text = students[indexPath.item].email
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
