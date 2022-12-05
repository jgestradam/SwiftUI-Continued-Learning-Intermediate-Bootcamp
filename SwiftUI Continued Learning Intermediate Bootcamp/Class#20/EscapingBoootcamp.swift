//
//  EscapingBoootcamp.swift
//  SwiftUI Continued Learning Intermediate Bootcamp
//
//  Created by Joseph Estrada on 12/5/22.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
//        downloadData3 { [weak self] returnedData in
//            self?.text = returnedData
//        }
        
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    func dowmloadData() -> String {
        return "new data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
            completionHandler("new data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("new data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResults) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResults(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResults(data: "New data!")
            completionHandler(result)
        }
    }
}

struct DownloadResults {
    let data: String
}

typealias DownloadCompletion = (DownloadResults) -> ()

struct EscapingBoootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBoootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBoootcamp()
    }
}
