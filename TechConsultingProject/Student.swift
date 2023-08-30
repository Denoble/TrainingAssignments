//
//  Student.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 2023-08-30.
//

import Foundation
import UIKit

struct Student{
    var name = ""
    var email = ""
    var imagePath:UIImage
    init(_name:String,_email:String,_imageUrl:UIImage){
        self.name = _name
        self.email = _email
        self.imagePath = _imageUrl
    }
 static  public func getStudents() -> [Student]{
       var students: [Student] = []
       
     guard let img = UIImage(named:"avatar-icon") else { return students }
       for i in 0 ... 9 {
          let name = "Student " + (i + 1).formatted()
           let email = "student\(i) @hotmail.com"
           var student: Student = Student(_name: name,_email: email,_imageUrl:img)
           students.append(student)
       }
      
        return students
    }
}
