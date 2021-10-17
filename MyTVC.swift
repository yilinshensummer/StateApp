//
//  MyTVC.swift
//  StateListsApp
//
//  Created by user on 5/10/21.
//

import UIKit
import CoreData

class MyTVC: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {
   
    var MyToDoItems :[ToDoItemMO] = []
    var fetchedResultsController: NSFetchedResultsController<ToDoItemMO>!
    var searchController : UISearchController!
    var searchResults: [ToDoItemMO] = []
    
    //override var prefersStatusBarHidden: Bool{
     //   return true
    //}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        let fetchRequest : NSFetchRequest<ToDoItemMO> = ToDoItemMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key:"stateName", ascending:true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchedResultsController.delegate = self
            
            do {
                try fetchedResultsController.performFetch()
                if let fetchedObjects = fetchedResultsController.fetchedObjects{
                    MyToDoItems = fetchedObjects
                }
            } catch{
                print(error)
                
            }
        
        
        if MyToDoItems.count == 0{
            let seedToDoItems = [
                ToDoItem("Alabama","Flag_of_Alabama.svg","Alabama","Alabama(AL)","Montgomery","Birmingham","4,887,871","52,420.07"),
                ToDoItem("Alaska","Flag_of_Alaska.svg","Alaska","Alaska(AK)","Juneau","Anchorage","737,438","665,384.04"),
                ToDoItem("Arizona","Flag_of_Arizona.svg","Arizona","Arizona(AZ)","Phoenix","Phoenix","7,171,646","113,990.30"),
                ToDoItem("Arkansas","Flag_of_Arkansas.svg","Arkansas","Arkansas(AR)","Little Rock","Little Rock","3,013,825","53,178.55"),
                ToDoItem("California","Flag_of_California.svg","California","California(CA)","Sacramento","Los Angeles","39,557,045","163,694.74"),
                ToDoItem("Colorado","Flag_of_Colorado.svg","Colorado","Colorado(CO)","Denver","Denver","5,695,564","104,093.67"),
                ToDoItem("Connecticut","Flag_of_Connecticut.svg","Connecticut","Connecticut(CT)","Hartford","Bridgeport","3,572,665","5,543.41"),
                ToDoItem("Delaware","Flag_of_Delaware.svg","Delaware","Delaware(DE)","Dover","Wilmington","967,171","2,488.72"),
                ToDoItem("Florida","Flag_of_Florida.svg","Florida","Florida(FL)","Tallahassee","Jacksonville","21,299,325","65,757.70"),
                ToDoItem("Georgia","Flag_of_Georgia_(U.S._state).svg","Georgia","Georgia(GA)","Atlanta","Atlanta","10,519,475","59,425.15"),
                ToDoItem("Hawaii","Flag_of_Hawaii.svg","Hawaii","Hawaii(HI)","Honolulu","Honolulu","1,420,491","10,931.72"),
                ToDoItem("Idaho","Flag_of_Idaho.svg","Idaho","Idaho(ID)","Boise","Boise","1,754,208","83,568.95"),
                ToDoItem("Illinois","Flag_of_Illinois.svg","Illinois","Illinois(IL)","Springfield","Chicago","12,741,080","57,913.55"),
                ToDoItem("Indiana","Flag_of_Indiana.svg","Indiana","Indiana(IM)","Indianapolis","Indianapolis","6,691,878","36,419.55"),
                ToDoItem("Iowa","Flag_of_Iowa.svg","Iowa","Iowa(IA)","Des Moines","Des Moines","3,156,145","56,272.81"),
                ToDoItem("Kansas","Flag_of_Kansas.svg","Kansas","Kansas(KS)","Topeka","Wichita","2,911,505","82,278.36"),
                ToDoItem("Kentucky","Flag_of_Kentucky.svg","Kentucky","Kentucky(KY)","Frankfort","Louisville","4,468,402","40,407.80"),
                ToDoItem("Louisiana","Flag_of_Louisiana.svg","Louisiana","Louisiana(LA)","Baton Rouge","New Orleans","4,659,978","52,378.13"),
                ToDoItem("Maine","Flag_of_Maine.svg","Maine","Maine(ME)","Augusta","Portland","1,338,404","35,379.74"),
                ToDoItem("Maryland","Flag_of_Maryland.svg","Maryland","Maryland(MD)","Annapolis","Baltimore","6,042,718","35,379.74"),
                ToDoItem("Massachusetts","Flag_of_Massachusetts.svg","Massachusetts","Massachusetts(MA)","Boston","Boston","6,902,149","10,554.39"),
                ToDoItem("Michigan","Flag_of_Michigan.svg","Michigan","Michigan(MI)","Lansing","Detroit","9,995,915","96,713.51"),
                ToDoItem("Minnesota","Flag_of_Minnesota.svg","Minnesota","Minnesota(MN)","Saint Paul","Minneapolis","5,611,179","86,935.83"),
                ToDoItem("Mississippi","Flag_of_Mississippi.svg","Mississippi","Mississippi(MS)","Jackson","Jackson","2,986,530","48,431.78"),
                ToDoItem("Missouri","Flag_of_Missouri.svg","Missouri","Missouri(MO)","Jefferson City","Kansas City","6,126,452","69,706.99"),
            ]
            
            for seedItem in seedToDoItems {
                let seedToDo = ToDoItemMO(context: context)
                seedToDo.stateName = seedItem.stateName
                seedToDo.flageImage = seedItem.flageImage
                seedToDo.sealImage = seedItem.sealImage
                seedToDo.stateAbr = seedItem.stateAbr
                seedToDo.stateCap = seedItem.stateCap
                seedToDo.stateLargCity = seedItem.stateLargCity
                seedToDo.stateAlrea = seedItem.stateAlrea
                seedToDo.statePopulation = seedItem.statePopulation
                
                appDelegate.saveContext()
            
                
            }
        }
            
    }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let insertIndexPath = newIndexPath{
                tableView.insertRows(at: [insertIndexPath], with: .fade)
            }
        case .delete:
            if let deletIndexPath = indexPath{
                tableView.deleteRows(at: [deletIndexPath], with: .fade)
            }
        case .update:
            if let changeIndexPath = indexPath{
                tableView.reloadRows(at: [changeIndexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
    
        if let fetchedObjects = controller.fetchedObjects{
            MyToDoItems = fetchedObjects as! [ToDoItemMO]
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive{
            return searchResults.count
        }
        else{
            return MyToDoItems.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "StateListsCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as! MyTableCell

        var cellItem : ToDoItemMO
        if searchController.isActive{
            cellItem = searchResults[indexPath.row]
        }
        else{
            cellItem = MyToDoItems[indexPath.row]
        }

        cell.showNameItem?.text = cellItem.stateName
        cell.showImage?.image = UIImage(named: cellItem.flageImage ?? "Flag_of_Alabama.svg")
        
        cell.alpha = 0
        
        var rotationTransform: CATransform3D = CATransform3DIdentity
        rotationTransform = CATransform3DTranslate(rotationTransform, -250, -250, 0)
        cell.showImage?.layer.transform = rotationTransform
        UIView.animate(withDuration: 10, animations: {cell.showImage?.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        })
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !searchController.isActive{
            if self.tableView.cellForRow(at: indexPath)?.accessoryType ==
                UITableViewCell.AccessoryType.none{
                self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            else{
                self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }
        }
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if searchController.isActive{
            return false
        }
        else{
            return true
        }
        
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
                let context = appDelegate.persistentContainer.viewContext
                let deleteItem = self.fetchedResultsController.object(at: indexPath)
                context.delete(deleteItem)
                appDelegate.saveContext()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showSegue"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let detailVC = segue.destination as!ViewController
                
                //detailVC.strStateName = StateAbrListsItem[indexPath.row]
                var cellItem : ToDoItemMO
                if searchController.isActive{
                    cellItem = searchResults[indexPath.row]
                }
                else{
                    cellItem = MyToDoItems[indexPath.row]
                }
                detailVC.strStateName = cellItem.stateName
                detailVC.strStateAbr = cellItem.stateAbr
                //detailVC.streStateInfo = StateAbrListsItem[indexPath.row]
                detailVC.strCapital = cellItem.stateCap
                detailVC.strLargecity = cellItem.stateLargCity
                detailVC.strPopu = cellItem.statePopulation
                detailVC.strStateArea = cellItem.stateAlrea
                
                detailVC.imgStateFlage = UIImage(named: cellItem.flageImage ?? "Flag_of_Alabama.svg")
                detailVC.imgStateSeal = UIImage(named: cellItem.sealImage ?? "Alabama")
                //let indexPathMap = type(of: indexPath)
                
               
            }
            
        }
        
       
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let textToSearch = searchController.searchBar.text{

            filterContentForSearchText(searchText: textToSearch)
            tableView.reloadData()
        }
    }
    func filterContentForSearchText(searchText: String){
        searchResults = MyToDoItems.filter({ (searchItem: ToDoItemMO ) -> Bool in
            let nameMatch = searchItem.stateName?.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            return nameMatch != nil
        })
        
        
    }
    

}
