import Foundation
@_spi(Internal) import MapboxCommon

extension TileRegionLoadOptions {
    /// Initializes a `TileRegionLoadOptions`, required for
    /// `TileStore.loadTileRegion(forId:loadOptions:)`
    ///
    /// - Parameters:
    ///   - geometry: The tile region's associated geometry (optional).
    ///   - descriptors: The tile region's tileset descriptors.
    ///   - metadata: A custom JSON value to be associated with this tile region.
    ///   - tileLoadOptions: Restrict the tile region load request to the
    ///         specified network types. If none of the specified network types
    ///         is available, the load request fails with an error.
    ///   - averageBytesPerSecond: Limits the download speed of the tile region.
    ///
    /// `averageBytesPerSecond` is not a strict bandwidth limit, but only
    /// limits the average download speed. tile regions may be temporarily
    /// downloaded with higher speed, then pause downloading until the rolling
    /// average has dropped below this value.
    ///
    /// If `metadata` is not a valid JSON object, then this initializer returns
    /// `nil`.
    public init?(geometry: Geometry?,
                 descriptors: [TilesetDescriptor],
                 metadata: Any? = nil,
                 acceptExpired: Bool = false ,
                 networkRestriction: NetworkRestriction = .none,
                 averageBytesPerSecond: UInt32? = nil) {
        if let metadata = metadata {
            guard JSONSerialization.isValidJSONObject(metadata) else {
                return nil
            }
        }

        self.init(_geometry: geometry,
                  descriptors: descriptors.isEmpty ? nil : descriptors,
                  metadata: metadata,
                  acceptExpired: acceptExpired,
                  networkRestriction: networkRestriction,
                  startLocation: nil, // Not yet implemented
                  averageBytesPerSecond: averageBytesPerSecond,
                  extraOptions: nil)
    }
}
