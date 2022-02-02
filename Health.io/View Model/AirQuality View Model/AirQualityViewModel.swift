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
    
    init(service: AirQualityProtocol = AirQualityService()) {
        self.service = service
    }
    
}
