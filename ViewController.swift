//
//  ViewController.swift
//  StateListsApp
//
//  Created by user on 5/10/21.
//

import UIKit


class ViewController: UIViewController {

   
    @IBOutlet weak var stateFlage: UIImageView!
    @IBOutlet weak var stateSeal: UIImageView!
   
    
    //@IBOutlet weak var stateAbr: UILabel!
    @IBOutlet weak var stateAbr: UILabel!
    //@IBOutlet weak var capital: UILabel!
    @IBOutlet weak var capital: UILabel!
    //@IBOutlet weak var largecity: UILabel!
    @IBOutlet weak var largecity: UILabel!
    //@IBOutlet weak var popu: UILabel!
    @IBOutlet weak var popu: UILabel!
    //@IBOutlet weak var stateArea: UILabel!
    
    @IBOutlet weak var stateArea: UILabel!
    
    var strStateName:String!
    var streStateInfo:String!
    
    var strStateAbr:String!
    var strCapital:String!
    var strLargecity:String!
    var strPopu:String!
    var strStateArea:String!
    
    
    var imgStateFlage:UIImage!
    var imgStateSeal:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.stateName.text = self.strStateName
        //self.stateInfo.text = self.streStateInfo
        self.stateAbr.text = self.strStateAbr
        self.capital.text = self.strCapital
        self.largecity.text = self.strLargecity
        self.popu.text = self.strPopu
        self.stateArea.text = self.strStateArea
        self.stateFlage.image = self.imgStateFlage
        self.stateSeal.image = self.imgStateSeal
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap"{
            
                let detailVCMap = segue.destination as!MapViewController
            detailVCMap.findAddress = self.strCapital
    }
        
    
    
    
}
    
}
