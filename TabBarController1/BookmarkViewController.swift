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
    
    let cars = ["RangeRover","BMW","Lamborgini","Tesla","cadilack",]
    let fruits = ["Apple","graps","pomagranate","watermelon","cherry","strawberry",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    @IBAction func segmentedControllbtnTapped(_ sender: Any) {
        tableview.reloadData()

    }
    
    @IBAction func plusbtn(_ sender: UIButton) {
        ShowAleart()
    }
    
    func ShowAleart(){
     
        let alertController = UIAlertController(title: "Create Folder", message: nil, preferredStyle: .alert)

        
        alertController.addTextField { textField in
            textField.placeholder = "Folder name"
        }

      
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            if let textField = alertController.textFields?.first {
                let enteredText = textField.text ?? ""
                print("Entered text: \(enteredText)")
                self.bookmark.append(enteredText)
                self.bookmark2.append(enteredText)
                
                self.tableview.reloadData()
                print(self.bookmark)
                print(self.bookmark2)
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
            return bookmark.count
        case 1:
            return bookmark2.count
            
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            cell.textLabel?.text = bookmark[indexPath.row]
       case 1:
            cell.textLabel?.text = bookmark2[indexPath.row]
        default:
            break
        }
        return cell
        
    }
}
