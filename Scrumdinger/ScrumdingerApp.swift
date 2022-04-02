//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/03/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            //MeetingView()
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
