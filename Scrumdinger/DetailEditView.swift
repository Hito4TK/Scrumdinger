//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/03/29.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName = ""
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Form {
            Section {
                TextField("Title", text: $data.title)
            } header: {
                Text("Meeting Info")
            }
            HStack {
                Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                    Text("Length")
                }
                .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                Spacer()
                Text("\(Int(data.lengthInMinutes)) minutes")
                    .accessibilityHidden(true)
            }

            Section {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)

                }
                
            } header: {
                Text("Attendees")
            }

            
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
