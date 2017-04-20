//
//  AddTaskViewController.swift
//  CoreToDo
//
//  Created by Madison Heck on 4/11/17.
//  Copyright © 2017 SebastianScales. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var isImp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
   

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let task = Task(context: context)
        task.name = textField.text!
        task.isImportant = isImp.isOn
        
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        do{
            let results = try moc.fetch(myRequest)
            
            for result in results
            {
                print(result)
            }
            
        } catch let error{
            print(error)
        }
        
        
        
      //  alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
      //  self.present(alert, animated: true, completion: nil)
        
        
        //Save data to core data
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    

}
