//
//  ViewController.swift
//  App8_2_Mapas
//
//  Created by User on 30/10/15.
//  Copyright © 2015 iCologic. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ICOMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //MARK: - VARIABLES LOCALES
    let locationManager : CLLocationManager = CLLocationManager()
    
    //MARK: - IB

    @IBOutlet weak var mySecondMap: MKMapView!
    
    
    //MARK: - LYFE APP
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fase 1 ->
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        // Solicitud de Autorizacion al Usuario // Info.plist NSLocationWhenInUseUsageDescription / NSLocationAlwaysUsageDescription
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation() // Inicio de la actualizacion de la localizacion
        
        // Fase 3 -> de Creacion de una chincheta
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "actionPressDisplay:")
        longPressGestureRecognizer.minimumPressDuration = 2
        mySecondMap.addGestureRecognizer(longPressGestureRecognizer)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - DELEGADO (Siempre se entera si la posicion cambia)
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        
        // Fase 2 ->
        let userLocation : CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta : CLLocationDegrees = 0.01
        let longDelta : CLLocationDegrees = 0.01
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        mySecondMap.setRegion(region, animated: true)
    
    }
    
    
    //MARK: - UTILS
    
    // FAse 3 ->
    func actionPressDisplay(gestureRecognizer: UIGestureRecognizer){
        
        
        
        
        
    }
    

}

