import Foundation

public class ArcRaidersDataInfo {
    public static let version = "1.0.0"
}

public enum PackageDataError: LocalizedError {
    case fileNotFound(String)
    case dataReadFailed(String)

    public var errorDescription: String? {
        switch self {
        case .fileNotFound(let filename):
            return "Paket içinde \(filename) bulunamadı."
        case .dataReadFailed(let filename):
            return "Paket içindeki \(filename) dosyasından veri okunamadı."
        }
    }
}

public class ArcRaidersData {

    public init() {}

    private func loadData(from file: String) throws -> Data {
        guard let url = Bundle.module.url(forResource: file, withExtension: "json", subdirectory: "Data") else {
            throw PackageDataError.fileNotFound("\(file).json")
        }

        do {
            return try Data(contentsOf: url)
        } catch {
            throw PackageDataError.dataReadFailed("\(file).json")
        }
    }

    public func loadItemsData() throws -> Data {
        return try loadData(from: "items")
    }

    public func loadQuestsData() throws -> Data {
        return try loadData(from: "quests")
    }

    public func loadSkillNodesData() throws -> Data {
        return try loadData(from: "skillNodes")
    }

    public func loadFactionsData() throws -> Data {
        return try loadData(from: "factions")
    }

    public func loadLocationsData() throws -> Data {
        return try loadData(from: "locations")
    }
}
