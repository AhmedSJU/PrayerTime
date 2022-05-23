//
//  LocationManager.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 09/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI
import CoreLocation

enum LocationPermissionStatus: String{
    case permissionGiven
    case permissionNotGiven
    case notDetermined
}
enum LocationRequestState: String {
    case shouldRequest
    case requested
    case doNotRequest
}


class LocationManager: NSObject, ObservableObject {
    @Published var isLocationFound: Bool = false
    @Published var isLocationPermissionGiven: Bool = true
    @Published var location: CLLocation = CLLocation()
    
    private var locationManager: CLLocationManager = CLLocationManager()
    private var shouldRequestLocation: LocationRequestState = .doNotRequest
    
    var locationPermissionStatus: LocationPermissionStatus = {
        var status = CLLocationManager.locationServicesEnabled()
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return .permissionGiven
        case .notDetermined:
            return .notDetermined
        default:
            return .permissionNotGiven
        }
    }()
    
    
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    func requestAccess(){
        switch self.locationPermissionStatus {
        case .permissionGiven:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            self.shouldRequestLocation = .requested
        case .permissionNotGiven:
            locationManager.stopUpdatingLocation()
            self.shouldRequestLocation = .doNotRequest
        case .notDetermined:
            self.shouldRequestLocation = .shouldRequest
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.shouldRequestLocation = .doNotRequest
        print("Location Service Error : \(error.localizedDescription)")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if self.shouldRequestLocation == .requested && self.locationPermissionStatus == .permissionGiven {
            if let location = locations.last {
                self.shouldRequestLocation = .shouldRequest
                self.locationManager.stopUpdatingLocation()
                self.location = location
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("status : \(status.rawValue)")
        switch status{
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationPermissionStatus = .permissionGiven
            switch shouldRequestLocation{
            case .doNotRequest:
                break
            case .shouldRequest:
                locationManager.startUpdatingLocation()
                self.shouldRequestLocation = .requested
            case .requested:
                break
            }
        case .notDetermined:
            self.locationPermissionStatus = .notDetermined
        default:
            self.locationPermissionStatus = .permissionNotGiven
            self.shouldRequestLocation = .doNotRequest
        }
    }
}


//
//import XCTest
//import CoreLocation
//@testable import CoreLocationDemo
//
//class CoreLocationDemoTests: XCTestCase {
//
//  func test_view_model_updates_latitude_and_longitude_properties() {
//    let locations: [CLLocation] = [CLLocation(latitude: 12, longitude: 10)]
//
//    let viewModel = LocationViewModel()
//
//    viewModel.locationManager(CLLocationManager(), didUpdateLocations: locations)
//
//    XCTAssertEqual(12, viewModel.userLatitude)
//    XCTAssertEqual(10, viewModel.userLongitude)
//  }
//}
