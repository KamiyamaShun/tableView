//
//  ViewController.swift
//  tableView
//
//  Created by 神山駿 on 2021/02/11.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var textArray = [String]()
    var imageArray = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 341
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let imageView = cell.contentView.viewWithTag(1)as! UIImageView
        let lable = cell.contentView.viewWithTag(2)as! UILabel
        
        lable.text = textArray[indexPath.row]
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
        
    }
    

    @IBAction func button(_ sender: Any) {
        if textArray.count > 5 || textField.text?.isEmpty == true{
            return
        }
        textArray.append(textField.text!)
        textField.text = ""
        if textArray.count <= 5{
            tableView.reloadData()
        }
        
    }
    
    
    
}

