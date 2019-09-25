//
//  ListView.swift
//  Mamoot!
//
//  Created by Alex Modroño Vara on 08/09/2019.
//  Copyright © 2019 Semiak, Lygre & JoeyPi. All rights reserved.
//
// NOTE: This is a lot of spaghetti code that is known by the State of California to produce brain harm and reproductive defects. Please try to stay away from it as much as possible.
//

import SwiftUI

struct LegacyList<Content: View> : View {
    
    let content: Content
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            content
        }
    }
    
}

//extension Group {
struct legacySection<Content: View> : View {
    var title: String
    let content: Content
    var color: Color
    var description: String
    
    @inlinable init(@ViewBuilder _ content: () -> Content, title: String, color: Color = .blue, description: String = "") {
        self.content = content()
        self.title = title
        self.color = color
        self.description = description
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(verbatim: title.uppercased())
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(color)
                Spacer()
            }.padding(.leading)
            Divider()
            content
            
            HStack {
                Text(description)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(10)
                    .padding(.leading)
                    .padding(.trailing)
                
                Spacer()
            }
        }.padding(.top)
    }
}
//}

struct legacySectionCell<Content: View> : View {
    var last: Bool
    let content: Content
    
    @inlinable init(@ViewBuilder _ content: () -> Content, last: Bool = false) {
        self.content = content()
        self.last = last
    }
    
    var body: some View {
        VStack {
            HStack {
                content
            }.padding(.leading)
            if last {
                Divider()
            } else {
               Divider().padding(.leading)
            }
        }
    }
}

struct exampleLegacyList: View {
    
    var body: some View {
        LegacyList {
            legacySection({
                legacySectionCell( {
                    exampleLegacySectionCell()
                })
                legacySectionCell({
                    exampleLegacySectionCell()
                }, last: true)
            }, title: "test section 1")
            
            legacySection({
                legacySectionCell( {
                    exampleLegacySectionCell()
                })
                legacySectionCell({
                    exampleLegacySectionCell()
                }, last: true)
            }, title: "test section 2")
            
            legacySection({
                legacySectionCell( {
                    exampleLegacySectionCell()
                })
                legacySectionCell({
                    exampleLegacySectionCell()
                }, last: true)
            }, title: "test section 3 with custom color", color: .yellow)
            
            legacySection({
                legacySectionCell( {
                    exampleLegacySectionCell()
                })
                legacySectionCell({
                    exampleLegacySectionCell()
                }, last: true)
            }, title: "test section 2",
               description: "Consider donating to mamoot! for us to keep it free for ever ;)")
            
            
        }
    }
}

struct exampleLegacySectionCell: View {
    
    var body: some View {
        HStack {
            Text("hey")
            Spacer()
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        exampleLegacyList()
    }
}
