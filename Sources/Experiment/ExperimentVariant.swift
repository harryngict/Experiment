//
//  ExperimentVariant.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public protocol Variant {
    /// Determines if the variant is active for a specific app version.
    ///
    /// - Parameters:
    ///   - version: The app version to check.
    /// - Returns: `true` if the variant is active for the specified version; otherwise, `false`.
    func isVariantActive(forVersion version: String) -> Bool
}

public struct ExperimentVariant: ExperimentDefinition, Variant, Decodable, Hashable {
    /// A unique identifier for the experiment variant.
    public let key: String

    /// The value associated with the experiment variant.
    public let value: ExperimentValue

    /// The version comparison rule for the experiment variant.
    public let supportedVersion: SupportedVersion

    /// Initializes an `ExperimentVariant` instance with the specified parameters.
    ///
    /// - Parameters:
    ///   - key: A unique identifier for the experiment variant.
    ///   - value: The value associated with the experiment variant.
    ///   - supportedVersion: The version comparison rule for the experiment variant.
    public init(key: String,
                value: ExperimentValue,
                supportedVersion: SupportedVersion)
    {
        self.key = key
        self.value = value
        self.supportedVersion = supportedVersion
    }

    /// Checks if the experiment variant is active for the provided app version.
    ///
    /// - Parameter appVersion: The app version to check against the supported version rule.
    /// - Returns: `true` if the experiment variant is active for the specified app version; otherwise, `false`.
    public func isVariantActive(forVersion appVersion: String) -> Bool {
        switch supportedVersion {
        case let .equal(version):
            return version == appVersion
        case let .lessThan(maxVersion):
            return appVersion < maxVersion
        case let .greaterThan(minVersion):
            return appVersion > minVersion
        case let .between(minVersion, maxVersion):
            return appVersion > minVersion && appVersion < maxVersion
        }
    }

    /// Conforms to the `Hashable` protocol by combining the hash values of its properties.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(key)
        hasher.combine(value)
        hasher.combine(supportedVersion)
    }
}
