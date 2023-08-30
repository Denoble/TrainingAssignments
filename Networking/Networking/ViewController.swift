//
//  ViewController.swift
//  Networking
//
//  Created by Uche Godfrey on 2023-08-30.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var products = readLocalFile()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        print("Count is : \(products.count)")
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell =  tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        if products.count > 0 {
            if   let url = URL(string: products[indexPath.item].thumbnail){
                cell.imageUI.load(url: url)
            }
            
            cell.title.text = products[indexPath.item].title
            cell.price.text = "$\(products[indexPath.item].price)"
            cell.itemDescription.text = products[indexPath.item].description
        }
        return cell
    }
    
}
func readLocalFile() -> [Product]{
    guard let url = Bundle.main.url(forResource: "Product", withExtension: "json") else{return [Product]()}
    print(url)
    do{
        let data = try  Data(contentsOf: url)
        print("data is \(data)")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try  decoder.decode(Response.self, from: data)
        //print("Response is \(response)")
        return response.products
    }catch{
        print("This is \(error.localizedDescription)")
    }
    return [Product]()
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
