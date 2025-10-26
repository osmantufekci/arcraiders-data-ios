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

    public func loadArcs() throws -> Data {
        return try loadData(from: "ardb_arcs")
    }

    public func craftingItems() throws -> Data {
        return try loadData(from: "ardb_crafting_items")
    }

    public func hideouts() throws -> Data {
        return try loadData(from: "ardb_hideouts")
    }

    public func loadItemsData() throws -> Data {
        return try loadData(from: "ardb_items")
    }

    public func loadQuestsData() throws -> Data {
        return try loadData(from: "ardb_quests")
    }

    public func loadSkillNodesData() throws -> Data {
        return try loadData(from: "skillNodes")
    }
}
