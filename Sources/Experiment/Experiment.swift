//
//  Experiment.swift
//  Experiment
//
//  Created by Hoang Nguyen on 5/12/23.
//

import Foundation

public final class Experiment: ExperimentInterface {
    private var experimentVariantDict = [String: ExperimentVariant]()
    private let assertable: ExperimentAssertableInterface

    public init(assertable: ExperimentAssertableInterface = ExperimentAssertable()) {
        self.assertable = assertable
    }

    public func getBoolValue(name: String, defaultValue: Bool, version: String) -> Bool {
        return getValue(name: name, defaultValue: defaultValue, version: version)
    }

    public func getStringValue(name: String, defaultValue: String, version: String) -> String {
        return getValue(name: name, defaultValue: defaultValue, version: version)
    }

    public func getLongValue(name: String, defaultValue: Int64, version: String) -> Int64 {
        return getValue(name: name, defaultValue: defaultValue, version: version)
    }

    public func getDoubleValue(name: String, defaultValue: Double, version: String) -> Double {
        return getValue(name: name, defaultValue: defaultValue, version: version)
    }

    public func getValue<T>(name: String, defaultValue: T, version: String) -> T {
        guard let variant = experimentVariantDict[name] else {
            assertable.assertVariableUndefined(name: name)
            return defaultValue
        }

        guard let value: T = variant.value.getValue() else {
            assertable.assertVariableTypeMismatched(name: name)
            return defaultValue
        }
        guard variant.isVariantActive(forVersion: version) else {
            assertable.assertVariableVersionMismatched(name: name)
            return defaultValue
        }
        return value
    }
}

public extension Experiment {
    func setup(providers: [ExperimentVariantProvider]) {
        let experimentVariants = providers.reduce([]) { result, provider -> [ExperimentVariant] in
            result + provider.experimentVariants
        }

        experimentVariants.forEach { experimentVariant in
            if experimentVariantDict[experimentVariant.key] != nil {
                assertable.assertVariableRedefined(name: experimentVariant.key)
            }
            experimentVariantDict[experimentVariant.key] = experimentVariant
        }
    }
}
