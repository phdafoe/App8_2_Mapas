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
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - DELEGADO (Siempre se entera si la posicion cambia)
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        
        
        
    }


}

