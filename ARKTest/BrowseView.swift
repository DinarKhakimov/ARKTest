//
//  BrowseView.swift
//  ARKTest
//
//  Created by Johnny Boshechka on 1/28/22.
//

import SwiftUI

struct BrowseView: View {
    @Binding var showBrowse: Bool
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                // Gridview for thumbnails
            }
            .navigationBarTitle(Text("Browse"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showBrowse.toggle()
            }) {
                Text("Done").bold()
            })
        }
    }
}
