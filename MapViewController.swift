//
//  MapViewController.swift
//  StateListsApp
//
//  Created by user on 6/16/21.
//
import CoreData
import UIKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var nearby: UITextField!
    @IBOutlet weak var btnNearby: UIButton!
    
    var myLocMgr = CLLocationManager()
    var myGeoCoder = CLGeocoder()
    var showPlacemark : CLPlacemark?
    var findAddress: String!
    var stateLegi : String!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLocMgr.delegate = self
        myLocMgr.requestWhenInUseAuthorization()
        myMap.delegate = self
        myMap.showsUserLocation = true
        view.backgroundColor = .gray
        
       
    
        
        
        myGeoCoder.geocodeAddressString(findAddress, completionHandler: {
            placemarks, error in
        
            if error != nil{
                print(error!)
                return
            }
            if placemarks != nil && placemarks!.count > 0 {
                let placemark = placemarks![0] as CLPlacemark
                self.showPlacemark = placemark
                
                let annotation = MKPointAnnotation()
                annotation.title = placemark.name
                annotation.coordinate = placemark.location!.coordinate
                self.myMap.addAnnotation(annotation)
                self.myMap.showAnnotations([annotation], animated: true)
            }
            
        })
        
    }
    
    @IBAction func findNearby(_ sender: Any) {
        
        let mySearchReq = MKLocalSearch.Request()
        mySearchReq.naturalLanguageQuery = self.nearby.text!
        mySearchReq.region = self.myMap.region
        
        let localSearch = MKLocalSearch(request: mySearchReq)
        localSearch.start(completionHandler: {searchRespones,searchError in
            
            if searchError != nil{
                print(searchError!)
                return
            }
            let myMapItems = searchRespones!.mapItems as [MKMapItem]
            var annotations : [MKAnnotation] = []
            if myMapItems.count > 0 {
                for item in myMapItems{
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (item.placemark.location?.coordinate)!
                    annotation.title = item.name
                    annotations.append(annotation)
                    
                }
            }
            self.myMap.showAnnotations(annotations, animated: true)
        })
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
