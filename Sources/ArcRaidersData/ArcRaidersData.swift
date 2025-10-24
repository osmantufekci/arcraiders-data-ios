import Foundation

public class ArcRaidersDataInfo {
    public static let version = "1.0.0"
}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    public static var module: Bundle = {
        let bundleName = "ArcRaidersData_ArcRaidersData"
        
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: ArcRaidersDataInfo.self).resourceURL,
            Bundle.main.bundleURL,
        ]
        
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named BioSwift_BioSwift")
    }()
}
