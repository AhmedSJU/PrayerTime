//
//  LocationService.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 20/05/2022.
//
import Foundation
import CoreLocation
import Combine

class LocationService: NSObject {
    typealias LocationResult = Result<CLLocation, LocationError>
    typealias AuthorizationResult = Result<Void, LocationError>
    
    typealias FutureAuthorizationResult = Future<Void, LocationError>
    typealias FutureLocationResult = Future<CLLocation, LocationError>
    typealias AuthorizationRequest = (AuthorizationResult) -> Void
    typealias LocationRequest = (LocationResult) -> Void
    
    private let locationManager = CLLocationManager()
    
    private var authorizationRequests: [AuthorizationRequest] = []
    private var locationRequests: [LocationRequest] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestWhenInUseAuthorization() -> FutureAuthorizationResult {
        guard locationManager.authorizationStatus == .notDetermined else {
            return Future{ $0(.success(())) }
        }
        let future = FutureAuthorizationResult { completion in
            self.authorizationRequests.append(completion)
        }
        locationManager.requestWhenInUseAuthorization()
        return future
    }
    
    func requestLocation() -> FutureLocationResult {
        guard locationManager.authorizationStatus == .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse else {
                    return Future { $0(.failure(.unauthorized)) }
                }
        
        let future = FutureLocationResult { completion in
            self.locationRequests.append(completion)
        }
        
        locationManager.requestLocation()
        return future
    }
    
    func handleLocationRequestResult(_ result: LocationResult) {
        while locationRequests.count > 0 {
            let request = locationRequests.removeFirst()
            request(result)
        }
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let locationError: LocationError
        if let error = error as? CLError, error.code == .denied {
            locationError = .unauthorized
        } else {
            locationError = .unableToDeternine
        }
        handleLocationRequestResult(.failure(locationError))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            handleLocationRequestResult(.success(location))
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        while authorizationRequests.count > 0 {
            let request = authorizationRequests.removeFirst()
            request(.success(()))
        }
    }
}
