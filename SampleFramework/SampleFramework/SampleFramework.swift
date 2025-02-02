//
//  SampleFramework.swift
//  SampleFramework
//
//  Created by Prashuk Ajmera on 2/1/25.
//

import Foundation

// Enforce the minimum Swift version for all platforms and build systems.
// Note that you can use whichever version you like, or not implement this at all.
#if swift(<5.9)
    #error("SampleFramework doesn't support Swift versions below 5.9.")
#endif

/// Reference to `SampleFramework.default` for quick bootstrapping; Alamofire style!
public let Sample = SampleFramework.default

public class SampleFramework {
    /// Shared singleton instance.
    public static let `default` = SampleFramework()
    
    // Prevent  developers from creating their own instances by making the initializer `private`.
    private init() {}
}

// MARK: - Public developer APIs

public extension SampleFramework {
    /**
     Fetch an `Activity` from Sample API.
     
     This is our API method for external developers who are going to utilize our framework.
     */
    func fetchActivity() async -> Result<Users, SampleFrameworkError> {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let activity = try JSONDecoder().decode(Users.self, from: data)
            return .success(activity)
        } catch DecodingError.dataCorrupted(let error) {
            return .failure(.decodingError(error))
        } catch let error {
            return .failure(.requestError(error))
        }
    }
}
