//
//  Bundle+HighScoresResources.swift
//  HighScores
//
//  Created by Ben Cochran on 2/29/20.
//

import Foundation

extension Bundle {

    static var highScoresResources: Bundle = {
        class BundleFinder: NSObject {}
        let bundleFinderBundle = Bundle(for: BundleFinder.self)
        guard let path = bundleFinderBundle.path(forResource: "HighScoresResources", ofType: "bundle") else {
            fatalError("Cannot find HighScoresResources.bundle in \(bundleFinderBundle)")
        }
        guard let bundle = Bundle(path: path) else {
            fatalError("Unable to load bundle at path \(path)")
        }
        return bundle
    }()

}
