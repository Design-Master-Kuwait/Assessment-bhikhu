//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import Foundation

// MARK: - ErrorModel
struct ErrorModel: Codable {
    let error: ErrorData?
}

// MARK: ErrorModel convenience initializers and mutators

extension ErrorModel {
    init(data: Data) throws {
        self = try JSONDecoder().decode(ErrorModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Error
struct ErrorData: Codable {
    let code: Int?
    let message: String?
    let meta: ErrorMeta?
}

// MARK: Error convenience initializers and mutators

extension ErrorData {
    init(data: Data) throws {
        self = try JSONDecoder().decode(ErrorData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Meta
struct ErrorMeta: Codable {
    let userStatus: String?
    let socialType: String?
    let socialId: String?
    let socialLoginStatus: Int?
    let otpCode: Int?
    let email: String?
    let mobile: String?


    enum CodingKeys: String, CodingKey {
        case userStatus = "user_status"
        case socialType = "social_type"
        case socialId =  "social_id"
        case socialLoginStatus = "social_login_status"
        case otpCode = "otp_code"
        case email, mobile
    }
}

// MARK: Meta convenience initializers and mutators

extension ErrorMeta {
    init(data: Data) throws {
        self = try JSONDecoder().decode(ErrorMeta.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

