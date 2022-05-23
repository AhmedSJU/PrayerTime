//
//  ConnectivityManager.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 14/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import Foundation
import Network

class ConnectivityManager: ObservableObject {
    
    var isMonitoring = false
    @Published var monitor: NWPathMonitor?
    
    var didStartMonitoringHandler: (() -> Void)?
    
    var didStopMonitoringHandler: (() -> Void)?
    
    var netStatusChangeHandler: (() -> Void)?
    
    init(){
        startMonitoring()
    }
    func startMonitoring() {
        guard !isMonitoring else { return }
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetStatus_Monitor")
        monitor?.start(queue: queue)
        monitor?.pathUpdateHandler = { _ in
            self.netStatusChangeHandler?()
        }
        
        isMonitoring = true
        didStartMonitoringHandler?()
    }
    func stopMonitoring() {
        guard isMonitoring, let monitor = monitor else { return }
        monitor.cancel()
        self.monitor = nil
        isMonitoring = false
        didStopMonitoringHandler?()
    }
    deinit {
        stopMonitoring()
    }
}
