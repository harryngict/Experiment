//
//  ExperimentInterface.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public protocol ExperimentInterface: AnyObject {
    
    /// Retrieves a boolean value for a specific experiment variant.
    ///
    /// - Parameters:
    ///   - name: The name of the experiment.
    ///   - defaultValue: The default value to return if the experiment variant is not active.
    ///   - version: The version of the application.
    /// - Returns: The boolean value associated with the experiment variant.
    func getBoolValue(name: String, defaultValue: Bool, version: String) -> Bool
    
    /// Retrieves a string value for a specific experiment variant.
    ///
    /// - Parameters:
    ///   - name: The name of the experiment.
    ///   - defaultValue: The default value to return if the experiment variant is not active.
    ///   - version: The version of the application.
    /// - Returns: The string value associated with the experiment variant.
    func getStringValue(name: String, defaultValue: String, version: String) -> String
    
    /// Retrieves a long (Int64) value for a specific experiment variant.
    ///
    /// - Parameters:
    ///   - name: The name of the experiment.
    ///   - defaultValue: The default value to return if the experiment variant is not active.
    ///   - version: The version of the application.
    /// - Returns: The long value associated with the experiment variant.
    func getLongValue(name: String, defaultValue: Int64, version: String) -> Int64
    
    /// Retrieves a double value for a specific experiment variant.
    ///
    /// - Parameters:
    ///   - name: The name of the experiment.
    ///   - defaultValue: The default value to return if the experiment variant is not active.
    ///   - version: The version of the application.
    /// - Returns: The double value associated with the experiment variant.
    func getDoubleValue(name: String, defaultValue: Double, version: String) -> Double
    
    /// Sets up the experiment interface with the provided experiment variant providers.
    ///
    /// - Parameter providers: An array of experiment variant providers.
    func setup(providers: [ExperimentVariantProvider])
}
