//
//  ExperimentValue.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public enum ExperimentValue: Codable, Hashable {

    /// Represents a boolean value.
    case bool(value: Bool)

    /// Represents a string value.
    case string(value: String)

    /// Represents a long (Int64) value.
    case long(value: Int64)

    /// Represents a double value.
    case double(value: Double)

    /// Coding keys used for encoding and decoding.
    private enum CodingKeys: String, CodingKey {
        case bool
        case string
        case long
        case double
    }

    /// Errors that can occur during encoding or decoding.
    enum ExperimentValueCodingError: Error {
        case decoding(String)
    }

    /// Initializes an `ExperimentValue` instance from a decoder.
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: An error of type `ExperimentValueCodingError` if decoding fails.
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? values.decode(Bool.self, forKey: .bool) {
            self = .bool(value: value)
            return
        }
        if let value = try? values.decode(String.self, forKey: .string) {
            self = .string(value: value)
            return
        }
        if let value = try? values.decode(Int64.self, forKey: .long) {
            self = .long(value: value)
            return
        }
        if let value = try? values.decode(Double.self, forKey: .double) {
            self = .double(value: value)
            return
        }

        throw ExperimentValueCodingError.decoding("Decode ExperimentValue failed. \(dump(values))")
    }

    /// Encodes the `ExperimentValue` instance to the provided encoder.
    ///
    /// - Parameter encoder: The encoder to write data to.
    /// - Throws: An error if encoding fails.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .bool(value): try container.encode(value, forKey: .bool)
        case let .string(value): try container.encode(value, forKey: .string)
        case let .long(value): try container.encode(value, forKey: .long)
        case let .double(value): try container.encode(value, forKey: .double)
        }
    }

    /// Retrieves the underlying value as a generic type.
    ///
    /// - Returns: The underlying value as a generic type.
    public func getValue<T>() -> T? {
        switch self {
        case let .bool(value): return value as? T
        case let .string(value): return value as? T
        case let .long(value): return value as? T
        case let .double(value): return value as? T
        }
    }
}
