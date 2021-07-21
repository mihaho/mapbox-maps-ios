import Foundation
import CoreLocation
@_spi(Internal) import MapboxCoreMaps

extension StylePackLoadOptions {
    /// Initializes a `StylePackLoadOptions`
    /// - Parameters:
    ///   - glyphsRasterizationMode: If provided, updates the style package's glyphs
    ///         rasterization mode, which defines which glyphs will be loaded from
    ///         the server.
    ///   - metadata: If provided, the custom JSON value will be stored alongside
    ///         the style package. You can use this field to store custom metadata
    ///         associated with a style package.
    ///   - acceptExpired: Accepts expired data when loading style resources. Default
    ///         is `false`.
    ///
    /// If `metadata` is not a valid JSON object, then this initializer returns
    /// `nil`.
    public init?(glyphsRasterizationMode: GlyphsRasterizationMode?,
                 metadata: Any? = nil,
                 acceptExpired: Bool = false) {
        if let metadata = metadata {
            guard JSONSerialization.isValidJSONObject(metadata) else {
                return nil
            }
        }
        self.init(_glyphsRasterizationMode: glyphsRasterizationMode,
                  metadata: metadata,
                  acceptExpired: acceptExpired)
    }
}
