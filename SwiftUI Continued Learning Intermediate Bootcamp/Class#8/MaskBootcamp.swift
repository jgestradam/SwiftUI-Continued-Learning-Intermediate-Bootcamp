//
//  MaskBootcamp.swift
//  SwiftUI Continued Learning Intermediate Bootcamp
//
//  Created by Joseph Estrada on 11/30/22.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack {
           startView
                .overlay {
                    overlayView
                        .mask(startView)
                }
            
            //Simple stars ui
//            HStack {
//                ForEach(1..<6) { index in
//                    Image(systemName: "star.fill")
//                        .font(.largeTitle)
//                        .foregroundColor(rating >= index ? Color.yellow : Color.gray)
//                        .onTapGesture {
//                            rating = index
//                        }
//                }
//            }
        }
    }
    
}

extension MaskBootcamp {
    private var startView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundColor(Color.yellow)
                    .fill(Gradient(colors: [Color.purple, Color.blue]))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        })
        .allowsHitTesting(false)
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
