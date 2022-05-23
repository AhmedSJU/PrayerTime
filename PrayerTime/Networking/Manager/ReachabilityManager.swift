
import Foundation
import SystemConfiguration




/// Protocol for listenig network status change
public protocol NetworkStatusListener : class {
    func networkStatusDidChange(status: Reachability.Connection)
}


class ReachabilityManager {
    static let shared = ReachabilityManager()
       
    
    
    
    
       // 3. Boolean to track network reachability
 
       
    
       // 5. Reachibility instance for Network status monitoring
     
    
    let reachability = try! Reachability()
       
    var isConnectedToNetwork : Bool {
        debugPrint("rech \(reachability.connection )")
        return reachability.connection != .unavailable
       
    //  return reachabilityStatus != .unavailable
       
     }
    
     
     // 4. Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.Connection = .unavailable
       // 6. Array of delegates which are interested to listen to network status change
       var listeners = [NetworkStatusListener]()
       
       
       
       /// Called whenever there is a change in NetworkReachibility Status
       ///
       /// — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(notification: Notification) {

           let reachability = notification.object as! Reachability

           switch reachability.connection {
           case .wifi:
               print("Reachable via WiFi")
           case .cellular:
               print("Reachable via Cellular")
           case .unavailable:
             print("Network not reachable")
    
           case .none:
              print("Network not reachable")
        }
           
           // Sending message to each of the delegates
           for listener in listeners {
            listener.networkStatusDidChange(status: reachability.connection)
           }
       }
       
       
       /// Starts monitoring the network availability status
       func startMonitoring() {
           
          NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(notification:)), name: .reachabilityChanged, object: reachability)
           do{
               try reachability.startNotifier()
           }catch{
               debugPrint("Could not start reachability notifier")
           }
       }
       
       /// Stops monitoring the network availability status
       func stopMonitoring(){
           reachability.stopNotifier()
       NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
       }
       
       
       /// Adds a new listener to the listeners array
       ///
       /// - parameter delegate: a new listener
       func addListener(listener: NetworkStatusListener){
           listeners.append(listener)
       }
       
       /// Removes a listener from listeners array
       ///
       /// - parameter delegate: the listener which is to be removed
       func removeListener(listener: NetworkStatusListener){
           listeners = listeners.filter{ $0 !== listener}
       }
   }
