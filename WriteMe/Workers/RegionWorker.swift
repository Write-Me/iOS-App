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
    private var service: RegionStoreProtocol
    @Published private(set) var regions: [Region] = []
    
    private var bindings = Set<AnyCancellable>()
    
    init(service: RegionStoreProtocol)
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
    
    func saveRegions(regions: [Region])
    {
        let saveRegionsCompletionHandler: (Subscribers.Completion<Never>) -> Void = { completion in
        }
        
        let saveRegionsValueHandler: ([Region]) -> Void = { [weak self] regions in
            self?.regions = regions
        }
        
        service.saveRegions(regions: regions)
            .sink(receiveCompletion: saveRegionsCompletionHandler, receiveValue: saveRegionsValueHandler)
            .store(in: &bindings)
    }
    
    func saveRegion(region: Region)
    {
        service.saveRegion(region: region)
    }
    
}

protocol RegionStoreProtocol
{
    func fetchRegions(synchronous: Bool) -> AnyPublisher<[Region], Never>
    func saveRegions(regions: [Region]) -> AnyPublisher<[Region], Never>
    func saveRegion(region: Region) -> AnyPublisher<Region, Never>
}
