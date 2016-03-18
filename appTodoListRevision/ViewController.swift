//
//  ViewController.swift
//  appTodoListRevision
//
//  Created by Mac on 3/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var a: Int = 0
    var fruitList = ["Mango", "Orange", "Grapes", "Apple"]
  

    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var taskTextBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        taskTableView.delegate = self
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
  }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return fruitList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        a = indexPath.row
        taskTextBox.text = fruitList[indexPath.row]
        
    }

    @IBAction func btnAddAction(sender: AnyObject) {
        if taskTextBox.text != ""
        {
            fruitList.append(taskTextBox.text!)
            taskTableView.reloadData()
            taskTextBox.text = ""
        }
        
    }
    @IBAction func btnUpdate(sender: AnyObject) {
        if taskTextBox.text != ""
        {
            fruitList[a] = taskTextBox.text!
            taskTableView.reloadData()
            taskTextBox.text = ""
        }
        
    }

    @IBAction func btnDelete(sender: AnyObject) {
        fruitList.removeAtIndex(a)
        taskTableView.reloadData()
        taskTextBox.text = ""
        
    }
}

