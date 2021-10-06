//
//  OSUIDWidget.swift
//  OSUIDWidget
//
//  Created by Oliver Elliott on 10/5/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), name: "---")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), name: "------")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, name: UserDefaults.getString(key: .name) ?? "")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let name: String
}

struct OSUIDWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image("osuLogo").resizable().frame(width: 72, height: 40, alignment: .center).padding()
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            Text("NAME")
                                .foregroundColor(Color("mainColor"))
                                .font(
                                    .system(size: 12)
                                        .bold())
                        }
                        HStack {
                            Spacer()
                            Text(entry.name)
                                .foregroundColor(Color.black)
                        }
                    }.padding()
                }
                Image("exampleBarcode").resizable().padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
            }
        }
        }
}

@main
struct OSUIDWidget: Widget {
    let kind: String = "OSUIDWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            OSUIDWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Barcode Widget")
        .description("Add this widget to your home or lock screen and present it when checking out")
        .supportedFamilies([.systemMedium])
    }
}

struct OSUIDWidget_Previews: PreviewProvider {
    static var previews: some View {
        OSUIDWidgetEntryView(entry: SimpleEntry(date: Date(), name: "Oliver Elliott"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
