//
//  ContentView.swift
//  AnimatedCell
//
//  Created by Abdulla on 17.03.2023.
//

import SwiftUI

struct AnimatedCellView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack {
            HStack {
                Text("Animated Cell")
                    .font(.headline)
                    .foregroundColor(isExpanded ? .blue : .black)
                    .animation(.easeInOut(duration: 1.0), value: isExpanded)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.title2)
                        .foregroundColor(isExpanded ? .blue : .black)
                }
            }
            
            if isExpanded {
                Text("This is the expanded content of the cell. It has additional text and can have any other SwiftUI views you want.")
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut(duration: 1.0), value: isExpanded)
            }
        }
        .padding()
        .background(isExpanded ? Color(.systemGray5) : Color(.systemGray6))
        .cornerRadius(10)
        .animation(.easeInOut(duration: 1.0), value: isExpanded)
    }
}

struct AnimatedCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCellView()
    }
}
