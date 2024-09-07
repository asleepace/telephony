//
//  ContentView.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import SwiftUI

struct InfoRow: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentView: View {
    
    @State private var callObserver = IncomingCallObserver()
    @State private var carrierInfo = getCarrierInfo()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Carrier Information")) {
                    InfoRow(title: "Carrier", value: carrierInfo.carrierName)
                    InfoRow(title: "MCC", value: carrierInfo.mobileCountryCode)
                    InfoRow(title: "MNC", value: carrierInfo.mobileNetworkCode)
                    InfoRow(title: "ISO Country Code", value: carrierInfo.isoCountryCode)
                    InfoRow(title: "Allows VoIP", value: carrierInfo.allowsVOIP ? "Yes" : "No")
                    InfoRow(title: "Network Type", value: carrierInfo.radioAccessTechnology)
                }
                
                Section(header: Text("Call Information")) {
                    InfoRow(title: "Call Status", value: callObserver.status)
                    if let call = callObserver.call {
                        InfoRow(title: "Call UUID", value: call.uuid.uuidString)
                        InfoRow(title: "Is Outgoing", value: call.isOutgoing ? "Yes" : "No")
                        InfoRow(title: "Has Ended", value: call.hasEnded ? "Yes" : "No")
                        InfoRow(title: "Has Connected", value: call.hasConnected ? "Yes" : "No")
                    }
                }
                
                Section(header: Text("Call Information")) {
                    InfoRow(title: "Call Status", value: callObserver.status)
                    if let call = callObserver.call {
                        InfoRow(title: "Call UUID", value: call.uuid.uuidString)
                        InfoRow(title: "Is Outgoing", value: call.isOutgoing ? "Yes" : "No")
                        InfoRow(title: "Has Ended", value: call.hasEnded ? "Yes" : "No")
                        InfoRow(title: "Has Connected", value: call.hasConnected ? "Yes" : "No")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Telephony Info")
        }
    }
}

#Preview {
    ContentView()
}
