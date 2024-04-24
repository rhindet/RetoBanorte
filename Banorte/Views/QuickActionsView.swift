//
//  ContentView.swift
//  Quick Actions Demo
//
//  Created by Hasan Ali Şişeci on 26.11.2023.
//

import SwiftUI
struct QuickActionsView: View {
    @State var navigationValue: Int? = nil
    @StateObject var qaManager = QuickActionsManager.instance
    @Environment(\.scenePhase) var phase
    @State private var currentIndex = 0
    var body: some View {
        VStack {
            if navigationValue != nil {
                NavigationLink(tag: 1, selection: $navigationValue) {
                    Text("Transferencias")
                        .font(.largeTitle).bold()
                } label: {
                    EmptyView()
                }
                NavigationLink(tag: 2, selection: $navigationValue) {
                    Text("Dimo")
                        .font(.largeTitle).bold()
                } label: {
                    EmptyView()
                }
                NavigationLink(tag: 3, selection: $navigationValue) {
                    Text("CoDi")
                        .font(.largeTitle).bold()
                } label: {
                    EmptyView()
                }
                NavigationLink(tag: 4, selection: $navigationValue) {
                    Text("Retiro sin tarjeta")
                        .font(.largeTitle).bold()
                } label: {
                    EmptyView()
                }
                NavigationLink(tag: 5, selection: $navigationValue) {
                    Text("Tarjeta Digital")
                        .font(.largeTitle).bold()
                } label: {
                    EmptyView()
                }
            }
            
            
            
            Group{
                TabView(selection: $currentIndex) {
                            ForEach(0..<3) { index in
                                Image("imagen\(index + 1)")
                                    .resizable()
                                    .frame(width: 330, height: 200)
                                    .tag(index)
                                    .onTapGesture {
                                        print("Tapped image \(index + 1)")
                                    }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if value.translation.width < 0 {
                                        currentIndex = min(currentIndex + 1, 2)
                                    } else if value.translation.width > 0 {
                                        currentIndex = max(currentIndex - 1, 0)
                                    }
                                }
                        )
            }
            Spacer() // Espacio entre los enlaces de navegación y el carrusel
        }
        .padding()
        
        .onChange(of: qaManager.quickAction) { _, _ in
            handleQAData()
        }
        .onAppear {
            handleQAData()
        }
    }
    
    private func handleQAData() {
        // Tu código para manejar acciones rápidas
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuickActionsView()
    }
}
