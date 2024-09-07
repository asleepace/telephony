//
//  CarrierInfo.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import CoreTelephony

struct CarrierInfo {
    let carrierName: String
    let mobileCountryCode: String
    let mobileNetworkCode: String
    let isoCountryCode: String
    let allowsVOIP: Bool
    let radioAccessTechnology: String
}

func getCarrierInfo() -> CarrierInfo {
    let networkInfo = CTTelephonyNetworkInfo()
    let carrier = networkInfo.serviceSubscriberCellularProviders?.values.first ?? CTCarrier()
    
    print("[getCarrierInfo] network info: \(networkInfo)")
    print("[getCarrierInfo] carrier info: \(carrier)")

    let radioTech = networkInfo.serviceCurrentRadioAccessTechnology?.values.first ?? "Unknown"
    
    let radioAccessTechnology: String
    switch radioTech {
    case CTRadioAccessTechnologyGPRS:
        radioAccessTechnology = "GPRS"
    case CTRadioAccessTechnologyEdge:
        radioAccessTechnology = "EDGE"
    case CTRadioAccessTechnologyWCDMA:
        radioAccessTechnology = "WCDMA"
    case CTRadioAccessTechnologyHSDPA:
        radioAccessTechnology = "HSDPA"
    case CTRadioAccessTechnologyHSUPA:
        radioAccessTechnology = "HSUPA"
    case CTRadioAccessTechnologyCDMA1x:
        radioAccessTechnology = "CDMA 1x"
    case CTRadioAccessTechnologyCDMAEVDORev0:
        radioAccessTechnology = "CDMA EV-DO Rev. 0"
    case CTRadioAccessTechnologyCDMAEVDORevA:
        radioAccessTechnology = "CDMA EV-DO Rev. A"
    case CTRadioAccessTechnologyCDMAEVDORevB:
        radioAccessTechnology = "CDMA EV-DO Rev. B"
    case CTRadioAccessTechnologyeHRPD:
        radioAccessTechnology = "eHRPD"
    case CTRadioAccessTechnologyLTE:
        radioAccessTechnology = "LTE"
    case "CTRadioAccessTechnologyNRNSA":
        radioAccessTechnology = "5G NSA"
    case "CTRadioAccessTechnologyNR":
        radioAccessTechnology = "5G"
    default:
        radioAccessTechnology = "Unknown"
    }
    
    return CarrierInfo(
        carrierName: carrier.carrierName ?? "Unknown",
        mobileCountryCode: carrier.mobileCountryCode ?? "Unknown",
        mobileNetworkCode: carrier.mobileNetworkCode ?? "Unknown",
        isoCountryCode: carrier.isoCountryCode ?? "Unknown",
        allowsVOIP: carrier.allowsVOIP,
        radioAccessTechnology: radioAccessTechnology
    )
}
