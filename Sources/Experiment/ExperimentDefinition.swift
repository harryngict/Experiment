//
//  ExperimentDefinition.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public protocol ExperimentDefinition: Hashable {
    /// A unique identifier for the experiment.
    var key: String { get }

    /// The value associated with the experiment.
    var value: ExperimentValue { get }

    /// The version comparison rule for the experiment.
    var supportedVersion: SupportedVersion { get }
}
