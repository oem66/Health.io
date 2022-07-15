//
//  AirQualityViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/2/22.
//

import Combine

final class AirQualityViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    private var service: AirQualityProtocol
    @Published var airQualityData = AirQuality()
    
    init(service: AirQualityProtocol = AirQualityService()) {
        self.service = service
    }
    
//    internal func fetchAQIData(completion: @escaping ()->()) {
//        cancellable = service.getCurrentAirQuality().sink(receiveCompletion: { completion in
//            switch completion {
//            case .finished:
//                debugPrint("Air Quality data successfully finished download!")
//            case .failure(let error):
//                debugPrint(error.localizedDescription)
//            }
//        }, receiveValue: { [weak self] aqiData in
//            guard let self = self else { return }
//            self.airQualityData = aqiData
//            completion()
//        })
//    }
    
    func getAirQualityData() {
        Task(priority: .background) {
            let result = await service.getAirQualityData()
          switch result {
          case .success(let airQualityResponse):
            debugPrint("RESPONSE SUCCESS: \(airQualityResponse)")
          case .failure(let error):
              debugPrint("RESPONSE FAILURE: \(error)")
          }
        }
    }
}
