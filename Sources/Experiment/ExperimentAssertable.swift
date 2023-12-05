//
//  ExperimentAssertable.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public protocol ExperimentAssertableInterface {
    
    /// Asserts that a variable with the given name is redefined, which is unexpected.
    ///
    /// - Parameter name: The name of the experiment variable.
    func assertVariableRedefined(name: String)
    
    /// Asserts that a variable with the given name is undefined, which is unexpected.
    ///
    /// - Parameter name: The name of the experiment variable.
    func assertVariableUndefined(name: String)
    
    /// Asserts that the version of a variable with the given name mismatches the expected version.
    ///
    /// - Parameter name: The name of the experiment variable.
    func assertVariableVersionMismatched(name: String)
    
    /// Asserts that the type of a variable with the given name mismatches the expected type.
    ///
    /// - Parameter name: The name of the experiment variable.
    func assertVariableTypeMismatched(name: String)
}

public struct ExperimentAssertable: ExperimentAssertableInterface {
    public init() {}

    public func assertVariableRedefined(name: String) {
        assertionFailure("Variable redefined, name: \(name)")
    }

    public func assertVariableUndefined(name: String) {
        assertionFailure("Variable undefined, name: \(name)")
    }

    public func assertVariableVersionMismatched(name: String) {
        assertionFailure("Variable version mismatched, name: \(name)")
    }

    public func assertVariableTypeMismatched(name: String) {
        assertionFailure("Variable type mismatched, name: \(name)")
    }
}
