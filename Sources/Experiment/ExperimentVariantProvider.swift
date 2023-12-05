//
//  ExperimentVariantProvider.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public protocol ExperimentVariantProvider {
    /// The name of the experiment variant provider.
    var name: String { get }

    /// A set containing the available experiment variants.
    var experimentVariants: Set<ExperimentVariant> { get }
}
