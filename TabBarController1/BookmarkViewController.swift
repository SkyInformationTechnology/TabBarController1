//
//  BookmarkViewController.swift
//  TabBarController1
//
//  Created by Md Akash on 13/3/24.
//

import UIKit




class BookmarkViewController: UIViewController {
    var  bookmark : [String] = []
    var  bookmark2 : [String] = []
    
    
    

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    
    var cars = ["RangeRover","BMW","Lamborgini","Tesla","cadilack",]
    var fruits = ["Apple","graps","pomagranate","watermelon","cherry","strawberry",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    @IBAction func segmentedControllbtnTapped(_ sender: Any) {
        tableview.reloadData()

    }
    
    @IBAction func plusbtn(_ sender: UIButton) {
        
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            addBookmarkAleart()
        case 1:
            addFavoritAleart()
            
        default:
            break
        }
       
    }
    
    func addBookmarkAleart(){
     
        let alertController = UIAlertController(title: "Create Folder", message: nil, preferredStyle: .alert)

        
        alertController.addTextField { textField in
            textField.placeholder = "Folder name"
        }

      
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            if let textField = alertController.textFields?.first {
                let enteredText = textField.text ?? ""
                print("Entered text: \(enteredText)")
                self.cars.append(enteredText)
                self.fruits.append(enteredText)
                
                self.tableview.reloadData()
                print(self.cars)
                print(self.fruits)
            }
        }

        alertController.addAction(createAction)

    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)

}
    func addFavoritAleart(){
     
        let alertController = UIAlertController(title: "Create Fevorit", message: nil, preferredStyle: .alert)

        
        alertController.addTextField { textField in
            textField.placeholder = "Folder name"
        }

      
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            if let textField = alertController.textFields?.first {
                let enteredText = textField.text ?? ""
                print("Entered text: \(enteredText)")
                self.cars.append(enteredText)
                self.fruits.append(enteredText)
                
                self.tableview.reloadData()
                print(self.cars)
                print(self.fruits)
            }
        }

        alertController.addAction(createAction)

    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)

}
    

    
    
    
    
    
}
extension  BookmarkViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            return cars.count
        case 1:
            return fruits.count
            
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            cell.textLabel?.text = cars[indexPath.row]
       case 1:
            cell.textLabel?.text = fruits[indexPath.row]
        default:
            break
        }
        return cell
        
    }
}
