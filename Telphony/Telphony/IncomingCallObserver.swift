//
//  IncomingCallObserver.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import CallKit
import SwiftUI

struct CallHistory: Identifiable {
    var id: UUID
    let uuid: UUID
    let createdAt: Date
    let updatedAt: Date
    let status: String
    let isOutgoing: Bool
    init(_ call: CXCall) {
        self.id = call.uuid
        self.uuid = call.uuid
        self.createdAt = Date.now
        self.updatedAt = Date.now
        self.status = call.description
        self.isOutgoing = call.isOutgoing
    }
}


class IncomingCallObserver: NSObject, CXCallObserverDelegate, ObservableObject {
    
    let myCallObserver: CXCallObserver
    
    @Published var call: CXCall?
    @Published var status: String = "No active call"
    @Published var history: [CallHistory] = []
    
    override init() {
        self.myCallObserver = CXCallObserver()
        super.init()
        self.myCallObserver.setDelegate(self, queue: .main)
    }
    
    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
        print("[IncomingCallObserver] observer: \(callObserver)")
        print("[IncomingCallObserver] call: \(call)")
        self.call = call
        self.addCallToHistory(call)
        print("[IncomingCallObserver] call uuid: \(call.uuid)")
        print("[IncomingCallObserver] call description: \(call.description)")
        print("[IncomingCallObserver] call hasConnected: \(call.hasConnected)")
        print("[IncomingCallObserver] call isOutgoing: \(call.isOutgoing)")
        print("[IncomingCallObserver] call isOnHold: \(call.isOnHold)")
    }
    
    func addCallToHistory(_ call: CXCall) {
        self.history.append(CallHistory(call))
    }
}

