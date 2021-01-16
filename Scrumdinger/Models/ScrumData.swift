//
//  ScrumData.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 16/01/2021.
//

import Foundation

class ScrumData: ObservableObject {
    @Published var scrums: [DailyScrum] = []

    private static var documentFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                            appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find document directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentFolder.appendingPathComponent("scrum.data")
    }
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.data
                }
                #endif
                return
            }
            guard let dailyScrums = try? JSONDecoder().decode([DailyScrum].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.scrums = dailyScrums
            }
        }
    }
}
