//
//  ContentView.swift
//  TableViewGameSTNBC
//
//  Created by Vahtee Boo on 03.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State private var count = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color("ColorGInner"), Color("ColorGOutter")],
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.gray)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.mint)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(5)
                Rectangle()
                    .foregroundColor(.brown)
                    .tag(6)
            }
            .frame(height: 250)
            .tabViewStyle(PageTabViewStyle())
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 6 ? 1 : count + 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
