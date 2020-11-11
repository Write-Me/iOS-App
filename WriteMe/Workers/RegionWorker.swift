//
//  RegionWorker.swift
//  WriteMe
//
//  Created by Vladimir on 07.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import Combine

class RegionWorker
{
    private var service: RegionProtocol
    @Published private(set) var regions: [Region] = []
    
    private var bindings = Set<AnyCancellable>()
    
    init(service: RegionProtocol)
    {
        self.service = service
    }
    
    func fetchRegions()
    {
        let fetchRegionsCompletionHandler: (Subscribers.Completion<Never>) -> Void = { completion in
        }
        
        let fetchRegionsValueHandler: ([Region]) -> Void = { [weak self] regions in
            self?.regions = regions
        }
        
        service.fetchRegions(synchronous: true)
            .sink(receiveCompletion: fetchRegionsCompletionHandler, receiveValue: fetchRegionsValueHandler)
            .store(in: &bindings)
    }
    
}

protocol RegionProtocol
{
    func fetchRegions(synchronous: Bool) -> AnyPublisher<[Region], Never>
}
