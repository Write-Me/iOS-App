//
//  RegionAPI.swift
//  WriteMe
//
//  Created by Vladimir on 07.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import Combine

private struct Envelope: Codable {
    let regions: [Region]
}

class RegionAPI: RegionStoreProtocol {
    func saveRegions(regions: [Region]) -> AnyPublisher<[Region], Never> {
        return Future<[Region], Never> { _ in
        }.eraseToAnyPublisher()
    }

    var localFile: URL {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("points.json")
        print("In case you need to delete the database: \(fileURL)")
        return fileURL
    }

    var defaultFile: URL {
        return Bundle.main.url(forResource: "regions", withExtension: "json")!
    }
}

extension RegionAPI {
    func fetchRegions(synchronous: Bool) -> AnyPublisher<[Region], Never> {
        return Future<[Region], Never> { promise in
            self.load(self.defaultFile) { points in
                DispatchQueue.main.async {
                    promise(.success(points))
                }
            }
        }.eraseToAnyPublisher()
    }

    func saveRegion(region: Region) -> AnyPublisher<Region, Never> {
        return Future<Region, Never> { _ in
        }.eraseToAnyPublisher()
    }
}

extension RegionAPI {
    private func load(_ file: URL, completion: @escaping ([Region]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let points = self.loadSynchronously(file)
            completion(points)
        }
    }

    private func loadSynchronously(_ file: URL) -> [Region] {
        do {
            let data = try Data(contentsOf: file)
            let envelope = try JSONDecoder().decode(Envelope.self, from: data)
            return envelope.regions
        } catch {
            clear()
            return loadSynchronously(defaultFile)
        }
    }

    private func clear() {
        try? FileManager.default.removeItem(at: localFile)
    }
}
