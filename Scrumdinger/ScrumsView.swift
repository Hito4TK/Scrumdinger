//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/03/24.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        
        List {
            ForEach(scrums/*, id: \.title*/) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
                
            }
            
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
