//
//  ArraysBootcamp.swift
//  SwiftUI Continued Learning Intermediate Bootcamp
//
//  Created by Joseph Estrada on 12/2/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    
    init () {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
        // filter
        // map
        
//        filteredArray = dataArray.sorted(by: { user1, user2 in
//            return user1.points > user2.points
//        })
        
        filteredArray = dataArray.sorted { $0.points > $1.points }
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Joseph", points: 5, isVerified: true)
        let user2 = UserModel(name: "Christ", points: 0, isVerified: false)
        let user3 = UserModel(name: "Joe", points: 20 , isVerified: true)
        let user4 = UserModel(name: "Emily", points: 50, isVerified: false)
        let user5 = UserModel(name: "Samantha ", points: 45, isVerified: true)
        let user6 = UserModel(name: "Jason", points: 23, isVerified: false)
        let user7 = UserModel(name: "Sarah", points: 76 , isVerified: true)
        let user8 = UserModel(name: "Lisa", points: 45, isVerified: false)
        let user9 = UserModel(name: "Steve", points: 1 , isVerified: true)
        let user10 = UserModel(name: "Amanda", points: 100, isVerified: false)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Poins: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.cornerRadius(10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
