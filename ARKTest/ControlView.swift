//
//  ControlView.swift
//  ARKTest
//
//  Created by Johnny Boshechka on 1/27/22.
//

import SwiftUI
import AVFoundation

struct ControlView: View {
    @Binding var isControlsVisble: Bool
    @Binding var showBrowse: Bool

    var body: some View {
        VStack {
            ControlVisibilityToggleButton(isControlsVisble: $isControlsVisble)
            
            Spacer()
            
            if isControlsVisble {
                ControlButtonBar(showBrowse: $showBrowse)
            }
        }
    }
}

struct ControlVisibilityToggleButton: View {
    @Binding var isControlsVisble: Bool
    var body: some View {
        HStack {
            
            Spacer()
            
            ZStack {
                
                Color.black.opacity(0.25)
                Button (action: {
                    print("Pressed button actionVisibility")
                    self.isControlsVisble.toggle()
                }) {
                    Image(systemName: self.isControlsVisble ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
        }
        .padding(.top, 45)
        .padding(.trailing, 20)
    }
}

struct ControlButtonBar: View {
    @Binding var showBrowse: Bool
    var body: some View {
        HStack {
            //MostRecentlyPlaced Button
            ControllButton(systemIconName: "clock.fill") {
                print("Most Resently Placed button pressed.")
            }
            Spacer()
            //Browse button
            ControllButton(systemIconName: "square.grid.2x2") {
               print("hello")
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse) {
                BrowseView(showBrowse: $showBrowse)
            }
                
            Spacer()
            //Settings button
            ControllButton(systemIconName: "slider.horizontal.3") {
                print("Settings button pressed.")
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black
                        .opacity(0.25))

    }
}

struct ControllButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}
