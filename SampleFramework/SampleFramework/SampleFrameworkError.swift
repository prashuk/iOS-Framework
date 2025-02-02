//
//  SampleFrameworkError.swift
//  SampleFramework
//
//  Created by Prashuk Ajmera on 2/1/25.
//

import Foundation

public enum SampleFrameworkError: Error {
    case invalidURL
    case requestError(_ error: Error)
    case decodingError(_ error: DecodingError.Context)
    
    public var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestError(let error): return "Request error: \(error.localizedDescription)"
        case .decodingError(let error): return "Decoding error: \(error.debugDescription)"
        }
    }
}
