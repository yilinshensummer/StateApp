//
//  AddViewController.swift
//  StateListsApp
//
//  Created by user on 6/3/21.
//

import UIKit
import CoreData
class AddViewController: UIViewController {

    
   
    @IBOutlet weak var addStateName: UITextField!
    @IBOutlet weak var addStateFlag: UITextField!
    
    var NewToDo : ToDoItemMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickedSave(_ sender: Any) {
        if let myAppDelegate =
            (UIApplication.shared.delegate as? AppDelegate)
        {
            NewToDo = ToDoItemMO(context:
                                    myAppDelegate.persistentContainer.viewContext)
            NewToDo.stateName = addStateName.text!
            NewToDo.flageImage = addStateFlag.text!
            NewToDo.sealImage = "" //ddStateSeal.text!
            NewToDo.stateCap = "" //.text!
            NewToDo.stateLargCity = "" //.text!
            NewToDo.statePopulation = "" //.text!
            NewToDo.stateAlrea = "" //.text!
            
            
            myAppDelegate.saveContext()
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func clickedCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
