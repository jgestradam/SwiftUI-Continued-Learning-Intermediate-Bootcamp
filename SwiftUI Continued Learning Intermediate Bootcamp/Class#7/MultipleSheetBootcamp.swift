//
//  MultipleSheetBootcamp.swift
//  SwiftUI Continued Learning Intermediate Bootcamp
//
//  Created by Joseph Estrada on 11/30/22.
//

import SwiftUI

struct RandonModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use mulple .sheets
// 3 - use $item

struct MultipleSheetBootcamp: View {
    
    @State var selectedMode: RandonModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedMode = RandonModel(title: "\(index)")
                    }
                }
                .sheet(item: $selectedMode) { model in
                    NextScreen(selectedModel: model)
                }
            }
        }
        
        //solution 3
//        VStack(spacing: 20) {
//            Button("Button 1") {
//                selectedMode = RandonModel(title: "One")
//            }
//
//            Button("Button 2") {
//                selectedMode = RandonModel(title: "Two")
//            }
//            .sheet(item: $selectedMode) { model in
//                NextScreen(selectedModel: model)
//            }
//        }
        
        //solution2
//        VStack(spacing: 20) {
//            Button("Button 1") {
//                //selectedMode = RandonModel(title: "One")
//                showSheet.toggle()
//            }
//            .sheet(isPresented: $showSheet) {
//                NextScreen(selectedModel: RandonModel(title: "One"))
//            }
//
//            Button("Button 2") {
//                //selectedMode = RandonModel(title: "Two")
//                showSheet2.toggle()
//            }
//            .sheet(isPresented: $showSheet2) {
//                NextScreen(selectedModel: RandonModel(title: "Two"))
//            }
//        }
        
        
        
//        .sheet(isPresented: $showSheet) {
//            NextScreen(selectedModel: selectedMode)
//        }
    }
}
 
struct NextScreen: View {
    
    let selectedModel: RandonModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetBootcamp()
    }
}
