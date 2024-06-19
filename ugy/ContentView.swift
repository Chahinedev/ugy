//
//  ContentView.swift
//  ugy
//
//  Created by Chahine Ouasti on 16/06/2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var test = 1
    @State private var batteryLevel: Float = UIDevice.current.batteryLevel
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            Background(geometry: geometry)
            
            VStack {
                Spacer()
                BatteryView(batteryLevel: $batteryLevel)
                    .frame(width: geometry.size.width)
                    .background(Color.gray.opacity(0.7))
                    .padding()
                
                
                HStack {
                    Text("Yone")
                    Image(systemName: "globe")
                    Text("test")
                    Button(action: {
                        test += 1
                        print(test)
                    }) {
                        Text("Test: \(test)")
                    }
                    Button(action: {
                        testFunc()
                    }) {
                        Text("Test: \(test)")
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.25)
                .background(Color.green.opacity(0.7))
                
                HStack {
                    Text("Yone")
                    Image(systemName: "globe")
                    Text("test")
                    Button(action: {
                        test += 1
                        print(test)
                    }) {
                        Text("Test: \(test)")
                    }
                    Button(action: {
                        testFunc()
                    }) {
                        Text("Test: \(test)")
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.60)
                .background(Color.gray.opacity(0.7))
                
                HStack {
                    Text("Yone")
                    Image(systemName: "globe")
                    Text("test")
                    Button(action: {
                        test += 1
                        print(test)
                    }) {
                        Text("Test: \(test)")
                    }
                    Button(action: {
                        testFunc()
                    }) {
                        Text("Test: \(test)")
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                .background(Color.red.opacity(0.7))
            }
            .onAppear {
                UIDevice.current.isBatteryMonitoringEnabled = true
                self.batteryLevel = UIDevice.current.batteryLevel
                NotificationCenter.default.addObserver(forName: UIDevice.batteryLevelDidChangeNotification, object: nil, queue: .main) { _ in
                    self.batteryLevel = UIDevice.current.batteryLevel
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct BatteryView: View {
    @Binding var batteryLevel: Float
    
    var body: some View {
        Spacer()
        VStack {
            if batteryLevel >= 0 {
                Text("\(Int(batteryLevel * 100))%")
                    .font(.largeTitle)
            } else {
                Text("Battery level unavailable")
                    .font(.largeTitle)
            }
        }
    }
}

public func testFunc() -> Void {
    var msg = "wesh"
    msg += "man"
    print(msg)
}

#Preview {
    ContentView()
}
