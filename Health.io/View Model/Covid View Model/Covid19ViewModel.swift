//
//  Covid19ViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/11/22.
//

import Foundation
import Combine

final class Covid19ViewModel: ObservableObject {
    @Published var covid19Data = Covid19Stats()
    private var covidSubscribers: AnyCancellable?
    private let covid19Service: Covid19Protocol
    
    init(covid19Service: Covid19Protocol = Covid19Service()) {
        self.covid19Service = covid19Service
    }
    
    internal func fetchCovid19Data(completion: @escaping ()->()) {
        covidSubscribers = covid19Service.fetchCovid19Data().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                debugPrint("Request is successful.")
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }, receiveValue: { [weak self] covid19Data in
            guard let self = self else { return }
            self.covid19Data = covid19Data
            debugPrint("Data: \(covid19Data)")
            completion()
        })
    }
}
