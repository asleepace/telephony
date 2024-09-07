//
//  CarrierInfoObserver.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import CoreTelephony

class CarrierInfoObserver: NSObject, CTTelephonyNetworkInfoDelegate, ObservableObject {
    
    let networkInfo = CTTelephonyNetworkInfo()
    
    @Published var dataServiceIdentifier: String
    
    override init() {
        self.dataServiceIdentifier = networkInfo.dataServiceIdentifier ?? "unknown"
        super.init()
        self.networkInfo.delegate = self
    }
    
    var carrier: CTCarrier? {
        print("[CarrierInfoObserver] serviceSubscriberCellularProviders: \(networkInfo.serviceSubscriberCellularProviders)")
        return networkInfo.serviceSubscriberCellularProviders?.values.first
    }
    
    var radioTech: String {
        print("[CarrierInfoObserver] serviceCurrentRadioAccessTechnology: \(networkInfo.serviceCurrentRadioAccessTechnology)")
        return networkInfo.serviceCurrentRadioAccessTechnology?.values.first ?? "unknown"
    }
    
    func getCarrierInfo() {
        self.dataServiceIdentifier = self.networkInfo.dataServiceIdentifier ?? "unknown"
    }
    
}
