//
//  LongPressGestureBootcamp.swift
//  SwiftUI Continued Learning Intermediate Bootcamp
//
//  Created by Joseph Estrada on 11/30/22.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        Text(isComplete ? "Complete" : "Not complete")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
            .onLongPressGesture(minimumDuration: 2.0, maximumDistance: 50) {
                isComplete.toggle()
            }
        
        VStack {
            Rectangle()
                .fill( isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        //min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPresing in
                        // Start of press -> mun duration
                        if isPresing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }

                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
            
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {

            LongPressGestureBootcamp()
    }
}
