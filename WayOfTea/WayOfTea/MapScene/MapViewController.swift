//
//  MapViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 11.04.2022.
//

import UIKit
import CoreLocation
import MapKit
import GameKit

class MapViewController: UIViewController {
    let contentView = MapView()
    var locationManager: CLLocationManager!
    var currentLocationStr = "Current location"
    let viewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
        
        viewModel.fetchData { result in
            switch result{
            case .success(_):
                self.addAnnotation()
            case .failure(_):
                print("Error")
            }
        }
    }
    
    func configureLocationManager() {
        self.locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            contentView.mapView.showsUserLocation = true
//            закоментировала, чтобы каждый раз не приближал
//            locationManager.startUpdatingLocation()
        }else {
            locationManager.requestWhenInUseAuthorization()
        }
        contentView.mapView.delegate = self
    }
    
    func updateMap(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        contentView.mapView.setRegion(region, animated: true)
    }
    
    func addAnnotation() {
        contentView.mapView.addAnnotations(viewModel.points)
    }
    override func loadView() {
        view = contentView
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let mUserLocation:CLLocation = locations[0] as CLLocation
//        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
//        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        contentView.mapView.setRegion(mRegion, animated: true)
//        // Get user's Current Location and Drop a pin
//        let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
//        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude)
//        mkAnnotation.title = self.setUsersClosestLocation(mLattitude: mUserLocation.coordinate.latitude, mLongitude: mUserLocation.coordinate.longitude)
//        contentView.mapView.addAnnotation(mkAnnotation)
//    }
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error - locationManager: \(error.localizedDescription)")
//    }
    
    //MARK:- Intance Methods
//    func determineCurrentLocation() {
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//        }
//    }
    //MARK:- Intance Methods
    
//    func setUsersClosestLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) -> String {
//        let geoCoder = CLGeocoder()
//        let location = CLLocation(latitude: mLattitude, longitude: mLongitude)
//
//        geoCoder.reverseGeocodeLocation(location) {
//            (placemarks, error) -> Void in
//
//            if let mPlacemark = placemarks{
//                if let dict = mPlacemark[0].addressDictionary as? [String: Any]{
//                    if let Name = dict["Name"] as? String{
//                        if let City = dict["City"] as? String{
//                            self.currentLocationStr = Name + ", " + City
//                        }
//                    }
//                }
//            }
//        }
//        return currentLocationStr
//    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        debugPrint("locations = \(locValue.latitude) \(locValue.longitude)")
        updateMap(lat: locValue.latitude, lon: locValue.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            // TODO: handle error or open settings
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = mapView.centerCoordinate
        print("Center = \(center.latitude) \(center.longitude)")
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? ArtworkObject else {return nil}
        var viewMarker: MKMarkerAnnotationView
        let idView = "marker"
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: idView) as? MKMarkerAnnotationView{
            view.annotation = annotation
            viewMarker = view
        }else {
            viewMarker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idView)
            viewMarker.canShowCallout = true
            viewMarker.calloutOffset = CGPoint(x: 0, y: 6)
            viewMarker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return viewMarker
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let coordinate = locationManager.location?.coordinate else  {return}
        self.contentView.mapView.removeOverlays(mapView.overlays)
        let point = view.annotation as? ArtworkObject
        let starpoint = MKPlacemark(coordinate: coordinate)
        let endpoint = MKPlacemark(coordinate: point!.coordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: starpoint)
        request.destination = MKMapItem(placemark: endpoint)
        request.transportType = .walking
        
        let direction = MKDirections(request: request)
        direction.calculate { (response, error) in
            guard let response = response else {return}
            for route in response.routes{
                self.contentView.mapView.addOverlay(route.polyline)
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = .green
        render.lineWidth = 4
        return render
    }
}
