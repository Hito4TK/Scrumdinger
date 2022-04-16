//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/03/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            //MeetingView()
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    /*
                    ScrumStore.save(scrums: store.scrums) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                    */
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            //fatalError("Error saving scrums.\(error.localizedDescription)")
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                    
                }
            }
            /*
            .onAppear {
                ScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
            */
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    //fatalError("Error loading scrums.\(error.localizedDescription)")
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
