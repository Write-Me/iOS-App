//
//  RegionRealmDataStore.swift
//  WriteMe
//
//  Created by Vladimir on 11.11.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import RealmSwift
import Combine

class RegionRealmDataStore: RegionStoreProtocol
{
    
    var regionData: RealmDataProtocol = RealmDataDelegate<Region>()
    
    func fetchRegions(synchronous: Bool) -> AnyPublisher<[Region], Never>
    {
        return Future<[Region], Never> { promise in
            promise(.success(self.regionData.all()))
        }.eraseToAnyPublisher()
    }
    
    func saveRegions(regions: [Region]) -> AnyPublisher<[Region], Never>
    {
        return Future<[Region], Never> { promise in
            promise(.success(self.regionData.save(objects: regions)))
        }.eraseToAnyPublisher()
    }
    
}
