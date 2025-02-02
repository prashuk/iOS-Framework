//
//  Activity.swift
//  SampleFramework
//
//  Created by Prashuk Ajmera on 2/1/25.
//

import Foundation

public struct Users: Codable {
    public let users: [User]
    public let total: Int
    public let skip: Int
    public let limit: Int
}

public struct User: Codable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let age: Int
    public let email: String
    public let image: String
}
