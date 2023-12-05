//
//  SupportedVersion.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public enum SupportedVersion: Decodable, Hashable {
    /// Represents an exact version match.
    case equal(String)

    /// Represents versions less than a specified version.
    case lessThan(String)

    /// Represents versions greater than a specified version.
    case greaterThan(String)

    /// Represents versions within a specified range.
    case between(String, String)

    /// Initializes a `SupportedVersion` case based on the provided decoder.
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: A `DecodingError` if the decoding fails or the data is corrupted.
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dictionary = try container.decode([String: String].self)
        if let eqValue = dictionary["equal"] {
            self = .equal(eqValue)
        } else if let ltValue = dictionary["lessThan"] {
            self = .lessThan(ltValue)
        } else if let gtValue = dictionary["greaterThan"] {
            self = .greaterThan(gtValue)
        } else if let betweenValues = dictionary["between"]?.components(separatedBy: ","), betweenValues.count == 2 {
            self = .between(betweenValues[0], betweenValues[1])
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid supportedVersion")
        }
    }
}
