//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

// App Dev Tutorials 진행 중
// 'Making classes observable' 단계부터 계속할 차례 - https://developer.apple.com/tutorials/app-dev-training/making-classes-observable
import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums: [DailyScrum] = DailyScrum.sampleData
    
    var body: some Scene {
        // WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
        WindowGroup {
            ScrumView(scrums: $scrums)
        }
    }
}
