//
//  ViewController.swift
//  findUserLocation
//
//  Created by MB on 15/2/19.
//  Copyright © 2019 [code]SIMPLE. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var usersMapView: MKMapView!
    
    // The location stuff
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        // Best - kCLLocationAccuracyBest is more accurate, but uses more battery
        manager.desiredAccuracy = kCLLocationAccuracyBest
        //Requests location only when app is in use.
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    // This function will update the labels with CLLocationManager info.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // This is adding the users location onto Map - showsCompass doesn't seem to work though.
        usersMapView.showsUserLocation = true
        usersMapView.showsCompass = true
        
        //Zoom to user location
        
        // TODO - Make the map show the users location when loads, currently its a manual process to find blue dot
        
        // The technical location details for the labels
        let location: CLLocation = locations[0]
        // Using self because it is is in a closure, away from main thread.
        // One line per label variable for each label in the UI - except for the closest address.
        self.latitudeLabel.text = String(location.coordinate.latitude)
        self.longitudeLabel.text = String(location.coordinate.longitude)
        self.courseLabel.text = String(location.course)
        self.speedLabel.text = String(location.speed)
        self.altitudeLabel.text = String(location.altitude)
        
        //prints above result to console
        print(locations)
        
        
        // The following code block is for the nearest address estimate
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil {
                print(error!)
            } else {
                // placemarks can return more than one value. using the square brackets, we choose only the first returned value.
                // returning the optional by using the ? symbol.
                if let placemark = placemarks?[0] {
                    // The following returns Strings
                    // placemarks is not an array. using the below is how we can devide the location into pieces which can be printed on demand.
                    
                    //street number
                    var address = ""
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                    }
                    //street name
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"
                    }
                    //neighborhood or landmark
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + "\n"
                    }
                    //State
                    if placemark.subAdministrativeArea != nil {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    //post code
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + "\n"
                    }
                    //you guessed it.
                    if placemark.country != nil {
                        address += placemark.country!
                    }
                    //Now to update the address label with the formatted address. "\n" = new line
                    self.addressLabel.text = address
                    
                    //print to console
                    print(address)
                } //End of placemark
            }
        } //End of reverse CLGeocoder code block - app should know where you are now.
    } //End of locationManager func
    


}

