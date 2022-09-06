//
//  MapView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 13.04.2022.
//

import UIKit
import MapKit

class MapView: UIView {

    let mapView : MKMapView = {
       let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mapView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }

}
