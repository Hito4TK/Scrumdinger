//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/03/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            //MeetingView()
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
