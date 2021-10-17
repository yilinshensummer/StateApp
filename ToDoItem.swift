//
//  ToDoItem.swift
//  StateListsApp
//
//  Created by user on 6/3/21.
//

import UIKit

class ToDoItem: NSObject {
    
    var stateName = ""
    var flageImage = ""
    var sealImage = ""
    var stateAbr = ""
    var stateCap = ""
    var stateLargCity = ""
    var statePopulation = ""
    var stateAlrea = ""
    
    //Delcare the init (contructor) method
    //_indicate don't have to provide the parameter name, only value
    init(_ istateName: String, _ iflageImage: String,_ isealImage: String,_ istateAbr: String,_ istateCap: String,_ istateLargCity: String,_ istatePopulation: String,_ istateAlrea: String ){
        stateName = istateName
        flageImage = iflageImage
        sealImage = isealImage
        stateAbr = istateAbr
        stateCap = istateCap
        stateLargCity = istateLargCity
        statePopulation = istatePopulation
        stateAlrea = istateAlrea
    }

}
