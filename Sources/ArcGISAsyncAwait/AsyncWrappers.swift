// Copyright 2021 Esri.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import ArcGIS

public extension AGSAnnotationLayer {
    
    /** Returns a list of the currently selected features.
     */
    func selectedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.selectedFeatures(completion: $0)
        }.call()
    }
    
    /** Selects the features that match the criteria in the @c AGSQueryParameters object and
     adds them to the current list of selected features.
     @param parameters The definition of the query to submit to the feature table.
     @param mode Defines how the list of currently selected features will be updated with the features returned from the query.
     */
    @discardableResult func selectFeatures(with parameters: AGSQueryParameters, mode: AGSSelectionMode) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.selectFeatures(with: parameters, mode: mode, completion: $0)
        }.call()
    }
    
}

public extension AGSAnnotationSublayer {
    
    /** Fetches the list of legend info.
     */
    func fetchLegendInfos() async throws -> Array<AGSLegendInfo> {
        try await AsyncOperation {
            self.fetchLegendInfos(completion: $0)
        }.call()
    }
    
}

public extension AGSArcGISFeature {
    
    /** Adds a new attachment for this feature.
     @param name The name.
     @param contentType Type of the content.
     @param data The data.
     @see @c AGSFeatureServiceSessionType
     */
    func addAttachment(withName name: String, contentType: String, data: Data) async throws -> AGSAttachment {
        try await AsyncOperation {
            self.addAttachment(withName: name, contentType: contentType, data: data, completion: $0)
        }.call()
    }
    
    /** Deletes an attachment of this feature.
     @param attachment The attachment.
     @see @c AGSFeatureServiceSessionType
     */
    func delete(_ attachment: AGSAttachment) async throws {
        try await AsyncOperation {
            self.delete(attachment, completion: $0)
        }.call()
    }
    
    /** Deletes a list of attachments from this feature.
     @param attachments An @c NSMutableArray of @c AGSAttachment. Contents of the @c NSMutableArray are copied.
     @see @c AGSFeatureServiceSessionType
     */
    func delete(_ attachments: Array<AGSAttachment>) async throws {
        try await AsyncOperation {
            self.delete(attachments, completion: $0)
        }.call()
    }
    
    /** Gets the list of attachments on this feature. Attachments are returned in descending order based on their id.
     @see @c AGSFeatureServiceSessionType
     */
    func fetchAttachments() async throws -> Array<AGSAttachment> {
        try await AsyncOperation {
            self.fetchAttachments(completion: $0)
        }.call()
    }
    
    /** Updates an attachment for this feature.
     @param attachmentInfo Information describing the attachment.
     @param name The name.
     @param contentType Type of the content.
     @param data The data.
     @see @c AGSFeatureServiceSessionType
     */
    func update(_ attachmentInfo: AGSAttachment, name: String, contentType: String, data: Data) async throws {
        try await AsyncOperation {
            self.update(attachmentInfo, name: name, contentType: contentType, data: data, completion: $0)
        }.call()
    }
    
}

public extension AGSArcGISFeatureTable {
    
    /** Returns the features added since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns no
     features because there is no concept of syncing.
     */
    func addedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.addedFeatures(completion: $0)
        }.call()
    }
    
    /** Returns the number of features added since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns 0
     because there is no concept of syncing.
     */
    func addedFeaturesCount() async throws -> Int {
        try await AsyncOperation {
            self.addedFeaturesCount(completion: $0)
        }.call()
    }
    
    /** Returns the features deleted since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns no
     features because there is no concept of syncing.
     */
    func deletedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.deletedFeatures(completion: $0)
        }.call()
    }
    
    /** Returns the number of features deleted since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns 0
     because there is no concept of syncing.
     */
    func deletedFeaturesCount() async throws -> Int {
        try await AsyncOperation {
            self.deletedFeaturesCount(completion: $0)
        }.call()
    }
    
    /** Returns all the features that were added, updated or deleted since the last sync.
    
     Returns a result object containing a feature edit iterator. For mobile geodatabase
     created by ArcGIS Pro, the iterator in the result object is empty because there
     is no concept of syncing.
    
     Note that edits inside a transaction (between calls to @c AGSGeodatabase#beginTransaction:
     and either @c AGSGeodatabase#commitTransaction: or @c AGSGeodatabase#rollbackTransaction:)
     share a common @c AGSLocalFeatureEdit#editDateTime and may not be returned in a consistent
     order.
     */
    func localEdits() async throws -> AGSLocalFeatureEditsResult {
        try await AsyncOperation {
            self.localEdits(completion: $0)
        }.call()
    }
    
    /** Returns the number of features that were added, updated or deleted since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns a count of 0 because
     there is no concept of syncing.
     */
    func localEditsCount() async throws -> Int {
        try await AsyncOperation {
            self.localEditsCount(completion: $0)
        }.call()
    }
    
    /** Returns the features updated since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns no
     features because there is no concept of syncing.
     */
    func updatedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.updatedFeatures(completion: $0)
        }.call()
    }
    
    /** Returns the number of features updated since the last sync.
    
     For mobile geodatabases created by ArcGIS Pro, this method returns 0
     because there is no concept of syncing.
     */
    func updatedFeaturesCount() async throws -> Int {
        try await AsyncOperation {
            self.updatedFeaturesCount(completion: $0)
        }.call()
    }
    
    /** Performs a query that returns the number of related features to the supplied feature.
     @param feature The feature which should be queried for the number of related features.
     @see @c AGSFeatureServiceSessionType
     */
    func queryRelatedFeatureCount(for feature: AGSArcGISFeature) async throws -> Int {
        try await AsyncOperation {
            self.queryRelatedFeatureCount(for: feature, completion: $0)
        }.call()
    }
    
    /** Performs a query that returns the number of related features to supplied feature based on the parameters.
     @param feature The feature which should be queried for the number of related features.
     @param parameters The parameters to the query.
     @see @c AGSFeatureServiceSessionType
     */
    func queryRelatedFeatureCount(for feature: AGSArcGISFeature, parameters: AGSRelatedQueryParameters) async throws -> Int {
        try await AsyncOperation {
            self.queryRelatedFeatureCount(for: feature, parameters: parameters, completion: $0)
        }.call()
    }
    
    /** Queries for related features of a given feature in all relationships.
    
     The origin and all destination tables must be associated with the same
     map, either as a feature source for a layer or added to the map via
     its table collection. Otherwise, the query will return no results.
     @param feature The feature for which to query related features.
     @see @c AGSFeatureServiceSessionType
     */
    func queryRelatedFeatures(for feature: AGSArcGISFeature) async throws -> [AGSRelatedFeatureQueryResult] {
        try await AsyncOperation {
            self.queryRelatedFeatures(for: feature, completion: $0)
        }.call()
    }
    
    /** Queries for related features of a given feature in a specific relationship.
    
     The origin and all destination tables must be associated with the same
     map, either as a feature source for a layer or added to the map via
     its table collection. Otherwise, the query will return no results.
     @param feature The feature for which to query related features.
     @param parameters Describes the relationship and the query to perform.
     @see @c AGSFeatureServiceSessionType
     */
    func queryRelatedFeatures(for feature: AGSArcGISFeature, parameters: AGSRelatedQueryParameters) async throws -> [AGSRelatedFeatureQueryResult] {
        try await AsyncOperation {
            self.queryRelatedFeatures(for: feature, parameters: parameters, completion: $0)
        }.call()
    }
    
    /** Validates constraints for a given feature participating in a relationship.
    
     The following are considered violations:
     * In a composite relationship, adding an orphan feature to the destination table
       without relating it to an origin feature
     * Cardinality Violations:
       - In 1:1 relationships, if an origin feature is already related to a destination
         feature, relating another feature to either of them
       - In 1:n relationships, relating a destination feature to more than one origin
         feature
    
     To recover from an orphaned destination feature violation, simply relate it to a valid origin feature.
     You can usually recover from a cardinality violation by unrelating the appropriate features. Also, see @c AGSArcGISFeature#unrelateFeature:
    
     Note that edit operations do not error when there are constraint violations. This allows you to recover from violations in a back office operation after applying edits or syncing,
     if you choose to do so. See ArcGIS Desktop [Validate Features](http://desktop.arcgis.com/en/arcmap/10.3/manage-data/editing-attributes/validating-features-and-relationships-in-arcmap.htm) process here.
    
     Note: This method makes network calls to query for the related features if they are not present locally. If you have just related the feature you are
     validating, you need to first call @c AGSFeatureTable#updateFeature:completion: to reflect the modified attribute value in the table. If this is not done, validation
     results may be incorrect.
     @param feature The feature.
     */
    func validateRelationshipConstraints(for feature: AGSArcGISFeature) async throws -> AGSRelationshipConstraintViolationType {
        try await AsyncOperation {
            self.validateRelationshipConstraints(for: feature, completion: $0)
        }.call()
    }
    
}

public extension AGSArcGISMapImageLayer {
    
    /** Loads all of the map service's sublayers and non spatial tables.
     */
    func loadTablesAndLayers() async throws {
        try await AsyncOperation {
            self.loadTablesAndLayers(completion: $0)
        }.call()
    }
    
}

public extension AGSArcGISSceneLayer {
    
    /** Returns a list of the currently selected features.
     */
    func getSelectedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.getSelectedFeatures(completion: $0)
        }.call()
    }
    
}

public extension AGSArcGISSublayer {
    
    /** Fetches the list of legend info.
     */
    func fetchLegendInfos() async throws -> Array<AGSLegendInfo> {
        try await AsyncOperation {
            self.fetchLegendInfos(completion: $0)
        }.call()
    }
    
}

public extension AGSAttachment {
    
    /** Fetches the attachment's data.
     */
    func fetchData() async throws -> Data {
        try await AsyncOperation {
            self.fetchData(completion: $0)
        }.call()
    }
    
}

public extension AGSClosestFacilityTask {
    
    /** Creates default parameters.
    
     Retrieves the default parameters as defined by the service.
     @see @c AGSClosestFacilityParameters, @c Future
     */
    func defaultClosestFacilityParameters() async throws -> AGSClosestFacilityParameters {
        try await AsyncOperation {
            self.defaultClosestFacilityParameters(completion: $0)
        }.call()
    }
    
    /** Solves a closest facility passing in a parameters object.
    
     Executes the @c AGSClosestFacilityParameters defined for this @c AGSClosestFacilityTask
     and returns an @c AGSClosestFacilityResult containing the results.
     @param closestFacilityParameters The closest facility parameters.
     @see @c Future, @c AGSClosestFacilityParameters
     */
    func solveClosestFacility(with parameters: AGSClosestFacilityParameters) async throws -> AGSClosestFacilityResult {
        try await AsyncOperation {
            self.solveClosestFacility(with: parameters, completion: $0)
        }.call()
    }
    
}

public extension AGSDictionarySymbolStyle {
    
    /** Asynchronously returns a symbol based on the provided attributes.
    
     This function is useful for obtaining a single, multi-layer symbol from supplied
     attributes. This is commonly used to create symbols and graphics on-the-fly. For
     example, with mil2525d, you may want to obtain a symbol where "symbolset" is 40,
     "modifier1" is "Incident Qualifier : Accident", "echelon" is "Army", and so on.
     All of these key/value pairs can be used to obtain the specific symbol that
     you need. Once you have that symbol, you can apply it to an @c AGSGraphic or @c AGSRenderer,
     obtain its swatch image, or serialize to JSON.
     If the DictionarySymbolStyle is not loaded then initiating this task will start the load cycle.
     @param attributes @c NSDictionary of @c NSString type key and @c id value. It is a key value pair for the attributes required to obtain symbol from the rule engine associated to Dictionary symbol style.
     */
    func symbol(attributes: [String: Any]) async throws -> AGSSymbol {
        try await AsyncOperation {
            self.symbol(attributes: attributes, completion: $0)
        }.call()
    }
    
}

public extension AGSDimensionLayer {
    
    /** Returns a list of the currently selected features.
     */
    func selectedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.selectedFeatures(completion: $0)
        }.call()
    }
    
    /** Selects the features that match the criteria in the @c AGSQueryParameters object and
     adds them to the current list of selected features.
     @param parameters The definition of the query to submit to the feature table.
     @param mode Defines how the list of currently selected features will be updated with the features returned from the query.
     */
    @discardableResult func selectFeatures(with parameters: AGSQueryParameters, mode: AGSSelectionMode) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.selectFeatures(with: parameters, mode: mode, completion: $0)
        }.call()
    }
    
}

public extension AGSExportTileCacheTask {
    
    /** Creates and returns a @c Future of @c AGSExportTileCacheParameters.
    
     This function is asynchronous because it makes use of the service metadata to build an
     @c AGSExportTileCacheParameters object. Calling the function will trigger load of the
     @c AGSExportTileCacheTask, unless it's already loaded.
    
     The supported geometry types for the area of interest are @c AGSEnvelope and @c AGSPolygon.
     The area of interest must have a spatial reference. When an @c AGSPolygon is supplied,
     tiles will be filtered according to the polygon geometry, which can help reduce the
     size of the resulting tile package. Note that the filtered set of tiles may vary,
     depending on the underlying service.
    
     The value of min_scale must be larger than the value of max_scale, unless they are 0.
     A min_scale value of 0 will result in this method choosing the services smallest level
     number, typically level 0.
    
     Similarly, a max_scale of 0 will result in the services largest level number being
     used, representing the closest in view being visible when taken offline. If min_scale
     is between the scales of tile levels the previous smallest level is used.
    
     If max_scale is between tile levels the next level is taken to ensure it is displayed.
     For example a simple service has 4 levels: level 0 scale 2000000; level 1 scale
     1000000; level 2 scale 500000; level 3 scale 250000.
    
     A min_scale of 0 and max_scale of 0 selects all levels 0,1,2,3.
    
     A min_scale of 750000 (between levels 1 and 2) and a max_scale of 25000 (at level 3)
     will select levels 1,2,3.
    
     A min_scale of 0 and a max_scale 750000 (between 1 and 2) will select levels 0,1,2.
    
     A min_scale of 1000000 and a max_scale of 0 will select all levels from 1 onwards
     1,2,3.
    
     Be careful when combining a large extent or a wide range of scales, this can result in
     the export failing due to exceeding the services maximum export tile count.
     @param areaOfInterest An @c AGSGeometry specifying the area to be exported. Must be non-@c nil.
     @param minScale The map scale '1:min_scale' which determines how far out to take offline. Can be 0 for the furthest out.
     @param maxScale The map scale '1:max_scale' which determines how far in to take offline. Can be 0 for the closest in the service allows.
     */
    func exportTileCacheParameters(withAreaOfInterest areaOfInterest: AGSGeometry, minScale: Double, maxScale: Double) async throws -> AGSExportTileCacheParameters {
        try await AsyncOperation {
            self.exportTileCacheParameters(withAreaOfInterest: areaOfInterest, minScale: minScale, maxScale: maxScale, completion: $0)
        }.call()
    }
    
}

public extension AGSExportVectorTilesTask {
    
    /** Creates and returns the default parameters for the export vector tile task.
    
     This function is asynchronous because it makes use of the service metadata to populate the @c AGSExportVectorTilesParameters object.
     Calling this function will trigger the @c AGSExportVectorTilesTask to be loaded, unless it is already loaded.
    
     The supported geometry types for the area of interest are @c AGSEnvelope and @c AGSPolygon. The area of interest must have a spatial reference.
     Where an @c AGSPolygon is supplied, tiles will be filtered according to the polygon geometry, which
     can help reduce the size of the resulting tile package. Note that the filtered set of tiles may vary, depending on
     the underlying service.
    
     A max_scale of 0 will include all levels of detail of the service.
     Be careful when you provide a large area of interest or a small max_scale value as this could result in a large number of tiles being requested.
     If the number of tiles requested exceeds the service's maximum export tile count the @c AGSExportVectorTilesJob will fail.
     @param areaOfInterest an @c AGSGeometry specifying the area of vector tiles to be exported. Must not be @c nil.
     @param maxScale the map scale '1:max_scale' which determines how far in to export the vector tiles. Set the value to 0 to include all levels of detail in the service.
     */
    func defaultExportVectorTilesParameters(withAreaOfInterest areaOfInterest: AGSGeometry, maxScale: Double) async throws -> AGSExportVectorTilesParameters {
        try await AsyncOperation {
            self.defaultExportVectorTilesParameters(withAreaOfInterest: areaOfInterest, maxScale: maxScale, completion: $0)
        }.call()
    }
    
}

public extension AGSFeatureLayer {
    
    /** Returns a list of the currently selected features.
     */
    func getSelectedFeatures() async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.getSelectedFeatures(completion: $0)
        }.call()
    }
    
    /** Selects the features that match the criteria in the @c AGSQueryParameters object and adds them to the current list of selected features.
     @param parameters The definition of the query to submit to the feature table.
     @param mode Defines how the list of currently selected features will be updated with the features returned from the query.
     */
    @discardableResult func selectFeatures(withQuery query: AGSQueryParameters, mode: AGSSelectionMode) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.selectFeatures(withQuery: query, mode: mode, completion: $0)
        }.call()
    }
    
}

public extension AGSFeatureTable {
    
    /** Adds a new feature to the table.
     @param feature The feature.
     @see @c AGSFeatureServiceSessionType
     */
    func add(_ feature: AGSFeature) async throws {
        try await AsyncOperation {
            self.add(feature, completion: $0)
        }.call()
    }
    
    /** Adds a list of features to the table.
     @param features An @c NSMutableArray of @c AGSFeature. Contents of the @c NSMutableArray are copied.
     @see @c AGSFeatureServiceSessionType
     */
    func add(_ features: Array<AGSFeature>) async throws {
        try await AsyncOperation {
            self.add(features, completion: $0)
        }.call()
    }
    
    /** Deletes a feature from the table.
     @param feature The feature.
     @see @c AGSFeatureServiceSessionType
     */
    func delete(_ feature: AGSFeature) async throws {
        try await AsyncOperation {
            self.delete(feature, completion: $0)
        }.call()
    }
    
    /** Deletes a list of features from the table.
     @param features An @c NSMutableArray of @c AGSFeature. Contents of the @c NSMutableArray are copied.
     @see @c AGSFeatureServiceSessionType
     */
    func delete(_ features: Array<AGSFeature>) async throws {
        try await AsyncOperation {
            self.delete(features, completion: $0)
        }.call()
    }
    
    /** Determines the minimum bounding envelope that contains features satisfying the provided query parameters.
    
     If no features meet the query criteria, an empty envelope is returned.
     @param queryParameters The parameters of the query.
     @see @c AGSFeatureServiceSessionType
     */
    func queryExtent(with parameters: AGSQueryParameters) async throws -> AGSGeometry {
        try await AsyncOperation {
            self.queryExtent(with: parameters, completion: $0)
        }.call()
    }
    
    /** Determines the count of features that satisfy the provided query parameters.
     @param queryParameters The parameters of the query.
     @see @c AGSFeatureServiceSessionType
     */
    func queryFeatureCount(with parameters: AGSQueryParameters) async throws -> Int {
        try await AsyncOperation {
            self.queryFeatureCount(with: parameters, completion: $0)
        }.call()
    }
    
    /** Submits a query against the table.
     @param parameters Options for controlling the operation.
     @see @c AGSFeatureServiceSessionType
     */
    func queryFeatures(with parameters: AGSQueryParameters) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.queryFeatures(with: parameters, completion: $0)
        }.call()
    }
    
    /** Calculates values for the requested statistics.
    
     Statistics query parameters may also define fields on which results are grouped or sorted.
     @param statisticsQueryParameters The parameters that define the statistics, fields, and features to be used for the query.
     @see @c AGSFeatureServiceSessionType
     */
    func queryStatistics(with parameters: AGSStatisticsQueryParameters) async throws -> AGSStatisticsQueryResult {
        try await AsyncOperation {
            self.queryStatistics(with: parameters, completion: $0)
        }.call()
    }
    
    /** Updates a feature in the table.
     @param feature The feature.
     @see @c AGSFeatureServiceSessionType
     */
    func update(_ feature: AGSFeature) async throws {
        try await AsyncOperation {
            self.update(feature, completion: $0)
        }.call()
    }
    
    /** Updates a list of features in the table.
     @param features An @c NSMutableArray of @c AGSFeature. Contents of the @c NSMutableArray are copied.
     @see @c AGSFeatureServiceSessionType
     */
    func update(_ features: Array<AGSFeature>) async throws {
        try await AsyncOperation {
            self.update(features, completion: $0)
        }.call()
    }
    
}

public extension AGSGeodatabaseSyncTask {
    
    /** Creates default parameters for a generate geodatabase.
    
     This will populate the parameters with values matching what the service supports.
     For example if the service does not support @c AGSSyncModelLayer then @c AGSSyncModelGeodatabase will be used
     All layers from the service will be included.
     The output spatial reference will be the spatial reference of the given extent.
     Attachments are included by default.
     @param extent The extent of the data to be included in the generated geodatabase. Must be non-@c nil.
     */
    func defaultGenerateGeodatabaseParameters(withExtent extent: AGSGeometry) async throws -> AGSGenerateGeodatabaseParameters {
        try await AsyncOperation {
            self.defaultGenerateGeodatabaseParameters(withExtent: extent, completion: $0)
        }.call()
    }
    
    /** Creates default parameters for a sync geodatabase.
    
     This will populate the parameters with values matching what the sync task's feature service and the geodatabase supports.
     For a geodatabase with @c AGSSyncModelLayer then all geodatabase layers will be included.
     If the service is read-only then the sync direction will be @c AGSSyncDirectionDownload.
     Otherwise the sync direction will be @c AGSSyncDirectionBidirectional.
     @param geodatabase a geodatabase to sync.
     */
    func defaultSyncGeodatabaseParameters(with geodatabase: AGSGeodatabase) async throws -> AGSSyncGeodatabaseParameters {
        try await AsyncOperation {
            self.defaultSyncGeodatabaseParameters(with: geodatabase, completion: $0)
        }.call()
    }
    
    /** Creates default parameters for a sync geodatabase using the given sync direction.
    
     This will populate the parameters with values matching what the sync task's feature service and the geodatabase supports.
     For a geodatabase with @c AGSSyncModelLayer then all geodatabase layers will be included.
     A service is editable if it has capabilities that include any of create, update or delete. In this case both @c AGSSyncDirectionBidirectional and
     @c AGSSyncDirectionUpload are supported sync directions.
     Alternatively, a service that does not have create, update or delete capability is considered read-only and only @c AGSSyncDirectionDownload
     will be supported.
     If the given sync direction is not compatible with the sync task's feature service or the geodatabase is not sync enabled, the returned task will fail.
     @param geodatabase a geodatabase to sync.
     @param syncDirection the sync direction to use.
     */
    func defaultSyncGeodatabaseParameters(with geodatabase: AGSGeodatabase, syncDirection: AGSSyncDirection) async throws -> AGSSyncGeodatabaseParameters {
        try await AsyncOperation {
            self.defaultSyncGeodatabaseParameters(with: geodatabase, syncDirection: syncDirection, completion: $0)
        }.call()
    }
    
    /** Generates an upload delta geodatabase file containing all the changes since the last sync.
    
     A delta geodatabase contains the changes that have occurred since a mobile replica
     @c AGSGeodatabase was last-synchronized with the feature service. See
     https://developers.arcgis.com/rest/services-reference/enterprise/synchronize-replica.htm
     for an overview of the delta files used in synchronization. An "upload" delta
     geodatabase contains the local edits, performed on the user's device, to be sent to the
     originating feature service. 
    
     When you run this task, any local edits in the @c AGSGeodatabase will be exported to the
     specified output path. The output path should include the full path and file name
     (ending in ".geodatabase") for the export.
    
     The delta file created by this method is not sent to the server and has no impact on
     any subsequent sync job. You can call this method repeatedly without affecting the
     state of the local geodatabase.
    
     The task returned by this method has a boolean result that indicates whether or not a
     delta geodatabase was created.
    
     You should not execute more than one sync on a particular geodatabase at the same time.
     This includes any operations that export or import deltas from the local
      @c AGSGeodatabase, which are:
     * @c AGSGeodatabaseSyncTask#exportDeltaWithGeodatabase:outputFileURL:completion:
     * @c AGSGeodatabaseSyncTask#importDeltaWithGeodatabase:inputFileURL:completion:
     * @c AGSSyncGeodatabaseJob
     * @c AGSOfflineMapSyncJob
     @param geodatabase The geodatabase to generate a delta from.
     @param outputFileURL The path and filename to save the generated delta to.
     @see @c AGSSyncGeodatabaseParameters#keepGeodatabaseDeltas
     */
    static func exportDelta(with geodatabase: AGSGeodatabase, outputFileURL: URL) async throws -> Bool {
        try await AsyncOperation {
            AGSGeodatabaseSyncTask.exportDelta(with: geodatabase, outputFileURL: outputFileURL, completion: $0)
        }.call()
    }
    
    /** Imports a geodatabase delta and applies it to the given geodatabase.
    
     A delta geodatabase contains the changes that have occurred since a mobile replica
     @c AGSGeodatabase was last-synchronized with the feature service. See
     https://developers.arcgis.com/rest/services-reference/enterprise/synchronize-replica.htm
     for an overview of the delta files used in synchronization. A "download" delta
     geodatabase contains the online edits that will be imported to the local geodatabase. 
    
     The task returned by this method returns an array of @c AGSSyncLayerResult.
    
     You should not execute more than one sync on a particular geodatabase at the same time.
     This includes any operations that export or import deltas from the local
     @c AGSGeodatabase, which are:
     * @c AGSGeodatabaseSyncTask#exportDeltaWithGeodatabase:outputFileURL:completion:
     * @c AGSGeodatabaseSyncTask#importDeltaWithGeodatabase:inputFileURL:completion:
     * @c AGSSyncGeodatabaseJob
     * @c AGSOfflineMapSyncJob
     @param geodatabase The geodatabase to apply a delta to.
     @param inputFileURL The path and filename to import the delta from
     */
    static func importDelta(with geodatabase: AGSGeodatabase, deltaPath: URL) async throws -> Array<AGSSyncLayerResult> {
        try await AsyncOperation {
            AGSGeodatabaseSyncTask.importDelta(with: geodatabase, deltaPath: deltaPath, completion: $0)
        }.call()
    }
    
    /** Registers a copy of a sync enabled geodatabase with a service to allow the copy to sync changes.
    
     This method is typically used as part of services pattern workflow, sometimes known as a pre-planned workflow.
     A sync enabled geodatabase is generated centrally and not modified or synced. Copies of this original geodatabase are distributed and loaded onto each user's device.
     The copy must first be registered with the service to allow the server to identify changes in subsequent sync operations.
     One of the main benefits of this workflow is a reduction in server load to generate geodatabases for many clients.
     It is important not to sync the copy before registering to ensure the server can maintain consistent state on each copy.
     This operation is not the opposite of @c AGSGeodatabaseSyncTask#unregisterGeodatabase:completion: which is used to
     remove a geodatabase from the service prior to deletion.
     @param geodatabase a geodatabase to register.
     */
    func registerSyncEnabledGeodatabase(_ geodatabase: AGSGeodatabase) async throws {
        try await AsyncOperation {
            self.registerSyncEnabledGeodatabase(geodatabase, completion: $0)
        }.call()
    }
    
    /** Unregisters a geodatabase from a service removing the services replica id.
    
     After unregistering a geodatabase it can no longer be synced back to the service.
     This is often used prior to deleting a local geodatabase.
     This operation is not related to @c AGSGeodatabaseSyncTask#registerSyncEnabledGeodatabase:completion:, which is for registering copies of a sync enabled geodatabase.
     @param geodatabase a geodatabase to unregister.
     */
    func unregisterGeodatabase(_ geodatabase: AGSGeodatabase) async throws {
        try await AsyncOperation {
            self.unregisterGeodatabase(geodatabase, completion: $0)
        }.call()
    }
    
    /** Unregisters a geodatabase from a service removing the service's replica id. This overload uses the geodatabase's
     sync ID rather than a reference to the geodatabase itself.
    
     This method is used to unregister a geodatabase from a service using the sync ID. This is commonly used to
     enable cleanup of the service after the local geodatabase has already been deleted. See @c AGSGeodatabase#syncID.
     After unregistering a geodatabase it can no longer be synced back to the service.
     This operation is not related to @c AGSGeodatabaseSyncTask#registerSyncEnabledGeodatabase:completion:, which is for registering copies of a sync enabled geodatabase.
     @param syncID sync ID of geodatabase to unregister.
     */
    func unregisterGeodatabase(withSyncID syncID: UUID) async throws {
        try await AsyncOperation {
            self.unregisterGeodatabase(withSyncID: syncID, completion: $0)
        }.call()
    }
    
}

public extension AGSGeoprocessingDataFile {
    
    /** Fetches the data file at the URL in the @c AGSGeoprocessingDataFile#URL property.
    
     If file_path is a directory, the file will be given the name of the file taken from the
     end of the @c AGSGeoprocessingDataFile#URL. The full file path will be available as the returned task's result.
     Alternatively file_path can be a destination filename within an existing directory.
     Note that any pre-existing file at that location with the same name will be deleted first.
     @param fileURL Path to a directory or full file name.
     */
    @discardableResult func download(toFileURL fileURL: URL) async throws -> URL {
        try await AsyncOperation {
            self.download(toFileURL: fileURL, completion: $0)
        }.call()
    }
    
}

public extension AGSGeoprocessingFeatures {
    
    /** Starts a request to fetch output features from the service.
    
     If the parameter is an output of a geoprocessing service this can be used to fetch features if
     @c AGSGeoprocessingFeatures#features is @c nil.
     It is not necessary to call this if @c AGSGeoprocessingFeatures#features is already populated.
     */
    func fetchOutputFeatures() async throws -> AGSFeatureSet {
        try await AsyncOperation {
            self.fetchOutputFeatures(completion: $0)
        }.call()
    }
    
}

public extension AGSGeoprocessingTask {
    
    /** Creates default parameters for a geoprocessing task.
    
     This will populate the parameters with default values for all of the input parameters defined by the service.
     If the service defines a default value for a parameter, this will be used. If no default value is defined for
     a parameter, it will be given an appropriate default for its type: boolean parameters @c NO, string parameters
     an empty string, numerical parameters 0.
     The correct execution type for this task will also be set.
     */
    func defaultGeoprocessingParameters() async throws -> AGSGeoprocessingParameters {
        try await AsyncOperation {
            self.defaultGeoprocessingParameters(completion: $0)
        }.call()
    }
    
}

public extension AGSGeotriggerMonitor {
    
    /** Starts evaluating the @c AGSGeotriggerMonitor.
    
     When the @c AGSGeotriggerMonitor is successfully performing checks, the @c AGSGeotriggerMonitor#status will be
     @c AGSGeotriggerMonitorStatusStarted.
     */
    func start() async throws {
        try await AsyncOperation {
            self.start(completion: $0)
        }.call()
    }
    
}

public extension AGSGeoView {
    
    /** Exports the current view to the provided buffer.
     */
    func exportImage() async throws -> UIImage {
        try await AsyncOperation {
            self.exportImage(completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on the specified graphics overlay. This overload will return the
     visible topmost graphic.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any graphics that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyGraphicsOverlayResult instance that is returned by the identify operation.
     - @c YES: only the 'popups' property will be populated with results. If the overlay does not have popups an error will be returned.
     - @c NO: the 'graphics' property will be populated, and the 'popups' property will be populated if the overlay has popups.
     @param graphicsOverlay The overlay on which to run the identify.
     @param screenPoint The location at which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the graphics property of the result is populated.
     */
    func identify(_ graphicsOverlay: AGSGraphicsOverlay, screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool) async -> AGSIdentifyGraphicsOverlayResult {
        await AsyncOperationNoThrow {
            self.identify(graphicsOverlay, screenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on the specified graphics overlay.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any graphics that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyGraphicsOverlayResult instance that is returned by the identify operation.
     - @c YES: only the 'popups' property will be populated with results. If the overlay does not have popups an error will be returned.
     - @c NO: the 'graphics' property will be populated, and the 'popups' property will be populated if the overlay has popups.
     @param graphicsOverlay The overlay on which to run the identify.
     @param screenPoint The location at which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the graphics property of the result is populated.
     @param maximumResults The maximum size of the result set of @c AGSGraphic to return. -1 indicates unlimited results.
     */
    func identify(_ graphicsOverlay: AGSGraphicsOverlay, screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool, maximumResults: Int) async -> AGSIdentifyGraphicsOverlayResult {
        await AsyncOperationNoThrow {
            self.identify(graphicsOverlay, screenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, maximumResults: maximumResults, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on all graphics overlays. This overload will return the single
     visible topmost graphic per overlay only.
    
     Results are returned in top-to-bottom order.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any graphics that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyGraphicsOverlayResult instances that are returned by the identify operation.
     - @c YES: only popups properties will be populated. Overlays without popups will be omitted.
     - @c NO: graphics properties will be populated. Overlays with popups will also return popups.
     @param screenPoint The location on which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the graphics property of the results are populated.
     */
    func identifyGraphicsOverlays(atScreenPoint screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool) async throws -> Array<AGSIdentifyGraphicsOverlayResult> {
        try await AsyncOperation {
            self.identifyGraphicsOverlays(atScreenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on all graphics overlays.
    
     Results are returned in top-to-bottom order.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any graphics that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyGraphicsOverlayResult instances that are returned by the identify operation.
     - @c YES: only popups properties will be populated. Overlays without popups will be omitted.
     - @c NO: graphics properties will be populated. Overlays with popups will also return popups.
     @param screenPoint The location on which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the graphics property of the results are populated.
     @param maximumResultsPerOverlay The maximum number of graphics to return per overlay. -1 indicates unlimited results.
     */
    func identifyGraphicsOverlays(atScreenPoint screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool, maximumResultsPerOverlay: Int) async throws -> Array<AGSIdentifyGraphicsOverlayResult> {
        try await AsyncOperation {
            self.identifyGraphicsOverlays(atScreenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, maximumResultsPerOverlay: maximumResultsPerOverlay, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on the specified layer. This overload will return the
     single visible topmost geoelement only per layer or sublayer.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any Geo-elements that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyLayerResult instance that is returned by the identify operation.
     - @c YES: only the 'popups' property will be populated with results. If the layer does not have popups an error will be returned.
     - @c NO: the 'geoElements' property will be populated. The 'popups' property will be populated if the layer has popups.
     @param layer The layer on which to run the identify.
     @param screenPoint The location at which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the geoElements property of the result is populated.
     */
    func identifyLayer(_ layer: AGSLayer, screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool) async -> AGSIdentifyLayerResult {
        await AsyncOperationNoThrow {
            self.identifyLayer(layer, screenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on the specified layer.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any Geo-elements that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyLayerResult instance that is returned by the identify operation.
     - @c YES: only the 'popups' property will be populated with results. If the layer does not have popups an error will be returned.
     - @c NO: the 'geoElements' property will be populated. The 'popups' property will be populated if the layer has popups.
     @param layer The layer on which to run the identify.
     @param screenPoint The location at which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the geoElements property of the result is populated.
     @param maximumResults The maximum size of the result set of geoelements (element type dependent on target layer) to return per layer or sublayer. -1 indicates unlimited results.
     */
    func identifyLayer(_ layer: AGSLayer, screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool, maximumResults: Int) async -> AGSIdentifyLayerResult {
        await AsyncOperationNoThrow {
            self.identifyLayer(layer, screenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, maximumResults: maximumResults, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on all layers in the view. This overload will return the
     single visible topmost geoelement per layer or sublayer only.
    
     Results are returned in top-to-bottom order.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any Geo-elements that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyLayerResult instances that are returned by the identify operation.
     - @c YES: each result's popups property will be populated with results. Layers without popups will be omitted.
     - @c NO: geoElements will be populated. Layers with popups will also return popups.
     @param screenPoint The location on which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the geoElements property of the results are populated.
     */
    func identifyLayers(atScreenPoint screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool) async throws -> Array<AGSIdentifyLayerResult> {
        try await AsyncOperation {
            self.identifyLayers(atScreenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, completion: $0)
        }.call()
    }
    
    /** Initiate an Identify operation on all layers in the view.
    
     Results are returned in top-to-bottom order.
    
     The 'tolerance' parameter determines the extent of the region used during the identify operation. Any Geo-elements that intersect
     this test region when rendered are returned, up to the maximum_results limit.
     A tolerance of 0 tests just the physical pixel at screen_point.
     Tolerance values above 0 are in DIPs and specify a circular region centered on screen_point, with radius equal to tolerance.
     The maximum allowed tolerance value is 100 DIPs, resulting in an identify circle of diameter 200 DIPs.
    
     The 'return_popups_only' parameter controls what properties are populated in the @c AGSIdentifyLayerResult instances that are returned by the identify operation.
     - @c YES: each result's popups property will be populated with results. Layers without popups will be omitted.
     - @c NO: geoElements will be populated. Layers with popups will also return popups.
     @param screenPoint The location on which to run identify in screen coordinates.
     @param tolerance Determines the extent of the region used during the identify operation. See remarks for further detail.
     @param returnPopupsOnly Controls whether the geoElements property of the results are populated.
     @param maximumResultsPerLayer The maximum number of geoelements to return per layer or sublayer. -1 indicates unlimited results.
     */
    func identifyLayers(atScreenPoint screenPoint: CGPoint, tolerance: Double, returnPopupsOnly: Bool, maximumResultsPerLayer: Int) async throws -> Array<AGSIdentifyLayerResult> {
        try await AsyncOperation {
            self.identifyLayers(atScreenPoint: screenPoint, tolerance: tolerance, returnPopupsOnly: returnPopupsOnly, maximumResultsPerLayer: maximumResultsPerLayer, completion: $0)
        }.call()
    }
    
    /** Sets the GeoView's viewpoint with the bookmark's value.
    
     Applies the viewpoint of the bookmark to the GeoView.
     @param bookmark The bookmark.
     */
    @discardableResult func setBookmark(_ bookmark: AGSBookmark) async -> Bool {
        await AsyncOperationNoThrow {
            self.setBookmark(bookmark, completion: $0)
        }.call()
    }
    
    /** Change the Geo view to the new viewpoint asynchronously.
     @param viewpoint The viewpoint.
     */
    @discardableResult func setViewpoint(_ viewpoint: AGSViewpoint) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpoint(viewpoint, completion: $0)
        }.call()
    }
    
    /** Change the Geo view to the new viewpoint asynchronously.
     @param viewpoint The viewpoint.
     @param durationSeconds The amount of time in seconds to move to the new viewpoint.
     */
    @discardableResult func setViewpoint(_ viewpoint: AGSViewpoint, duration: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpoint(viewpoint, duration: duration, completion: $0)
        }.call()
    }
    
}

public extension AGSItem {
    
    /** Fetches the item's data.
     */
    func fetchData() async throws -> Data {
        try await AsyncOperation {
            self.fetchData(completion: $0)
        }.call()
    }
    
    /** Updates an item's properties in a file on disk when this item instance is an @c AGSLocalItem.
    
     This method resides in the @c AGSItem base class to match the public API, but within the
     C API it's implemented only on @c AGSLocalItem and @c AGSPortalItem
     simply throws an exception. The client APIs provide their own implementations of this method
     for PortalItems.
    
     The following remarks apply when the item instance is an @c AGSLocalItem.
    
     Updating properties can be only done for local items that are unpacked.
     For example a mobile map package file (.mmpk) can be unpacked using
     @c AGSMobileMapPackage#unpackWithMobileMapPackageFileURL:outputDirectory:completion:. Once unpacked local items within the package can be updated see
     @c AGSMobileMapPackage#item and for any maps use @c AGSGeoModel#item.
     As well as packages, the local item available from an item resource cache can be updated. This is accessed
     with @c AGSItemResourceCache#item.
     If the package is not unpacked an error of @c AGSErrorCodeCommonInvalidCall is returned as an
     error in the async task.
     */
    func updateProperties() async throws {
        try await AsyncOperation {
            self.updateProperties(completion: $0)
        }.call()
    }
    
}

public extension AGSJob {
    
    /** Initiates a request to check the server status.
    
     The task contains a bool indicating if the check was successful.  The task completes after the status has been checked.
     If the job is polling the server for status and is in a time gap, then calling this method will
     ensure a request is sent right away.
     The result can be @c NO if the job is not checking server status for example if the job status is paused or uploading.
     */
    func checkStatus() async throws {
        try await AsyncOperation {
            self.checkStatus(completion: $0)
        }.call()
    }
    
}

public extension AGSKMLNode {
    
    /** Saves the node and any referenced local files into a zipped KMZ archive.
    
     The node will be saved to a KMZ file to ensure that any referenced files are available locally when sharing the file with others.
     If this method is called on a leaf node (e.g. KMLPlacemark, KMLGroundOverlay, etc), only that node and its referenced files will be saved.
     If this method is called on container node (e.g. KMLDocument, KMLFolder), the node and all of its children and referenced files will be saved.
     If this method is called on a KMLNetworkLink, the link will be saved but the children will not. This is because the children will simply be
     refetched when the saved KMLNetworkLink is loaded.
     Saving referenced files will differ based on the type of reference. For HTTP paths, the path will be saved as is but the referenced file will
     not be zipped into the archive, as it will simply be refetched when the new KMZ is loaded. For relative paths, the path will be saved as is 
     and the referenced file will be zipped relative to the root of the KMZ file. For absolute paths, the path will be converted to a relative path,
     and the referenced file will be zipped into a "files" folder at the root of the KMZ file. For example, "C:/icons/some_icon.png" would be converted
     to "files/some_icon.png" and stored at that location in the KMZ file.
     The filename supports unicode characters as well as nested directories. It must be non-empty and there must not be an existing file located there.
     Saving a node to a KMZ file requires an ArcGIS Runtime 'Standard' license level.
     @param fileURL The KMZ filepath to which the node should be saved.
     */
    func save(toFileURL fileURL: URL) async throws {
        try await AsyncOperation {
            self.save(toFileURL: fileURL, completion: $0)
        }.call()
    }
    
}

public extension AGSLayer {
    
    /** Fetches the list of legend info.
     */
    func fetchLegendInfos() async throws -> Array<AGSLegendInfo> {
        try await AsyncOperation {
            self.fetchLegendInfos(completion: $0)
        }.call()
    }
    
}

public extension AGSLocatorTask {
    
    /** Geocodes multiline address and returns candidates.
    
     Executes a geocoding operation to find location candidates for a given multiline address.
     @param searchValues Multiline address inputs.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func geocode(withSearchValues searchValues: [String: String]) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.geocode(withSearchValues: searchValues, completion: $0)
        }.call()
    }
    
    /** Geocodes multiline address with parameters and returns candidates.
    
     Executes a geocoding operation to find location candidates for a given multiline address.
     @param searchValues Multiline address inputs.
     @param parameters Geocode method parameters.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func geocode(withSearchValues searchValues: [String: String], parameters: AGSGeocodeParameters) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.geocode(withSearchValues: searchValues, parameters: parameters, completion: $0)
        }.call()
    }
    
    /** Geocodes address and returns candidates.
    
     Executes a geocoding operation to find location candidates for a given address.
     @param searchText Address inputs.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func geocode(withSearchText searchText: String) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.geocode(withSearchText: searchText, completion: $0)
        }.call()
    }
    
    /** Geocodes address with parameters and returns candidates.
    
     Executes a geocoding operation to find location candidates for a given address.
     @param searchText Address inputs.
     @param parameters Geocode method parameters.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func geocode(withSearchText searchText: String, parameters: AGSGeocodeParameters) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.geocode(withSearchText: searchText, parameters: parameters, completion: $0)
        }.call()
    }
    
    /** Geocodes suggest and returns candidates.
    
     Executes geocoding based on result of suggestion.
     @param suggestResult Suggest method result.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func geocode(with suggestResult: AGSSuggestResult) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.geocode(with: suggestResult, completion: $0)
        }.call()
    }
    
    /** Geocodes suggest with parameters and returns candidates.
    
     Executes geocoding based on result of suggestion.
     @param suggestResult Suggest method result.
     @param parameters Geocode parameters.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func geocode(with suggestResult: AGSSuggestResult, parameters: AGSGeocodeParameters) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.geocode(with: suggestResult, parameters: parameters, completion: $0)
        }.call()
    }
    
    /** Finds address by location point.
    
     Executes a reverse-geocoding operation to find address candidates for a given location.
     @param location The location point.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func reverseGeocode(withLocation location: AGSPoint) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.reverseGeocode(withLocation: location, completion: $0)
        }.call()
    }
    
    /** Finds address with parameters by location point.
    
     Executes a reverse-geocoding operation to find address candidates for a given location.
     @param location The location point.
     @param parameters The  reverse geocode parameters.
     @see @c Future, @c AGSGeocodeResult, @c AGSGeocodeResult
     */
    func reverseGeocode(withLocation location: AGSPoint, parameters: AGSReverseGeocodeParameters) async throws -> Array<AGSGeocodeResult> {
        try await AsyncOperation {
            self.reverseGeocode(withLocation: location, parameters: parameters, completion: $0)
        }.call()
    }
    
    /** Suggest address and returns possible variants.
    
     Geocoding suggestions provide a mechanism for implementing character-by-character auto-complete.
     Using a text input and optional @c AGSSuggestParameters, suggested addresses can be quickly found and
     presented to the user. Suggestions are not limited to addresses, they can also be used for POIs
     (Points of Interest). To return a focused set of suggestions, set the @c AGSSuggestParameters#preferredSearchLocation
     or the @c AGSSuggestParameters#searchArea. Using the @c AGSSuggestParameters#preferredSearchLocation is
     similar to how ArcGIS Pro limits the suggestions returned.
     @param searchText Part of address text.
     @see @c Future, @c NSArray, @c AGSSuggestResult
     */
    func suggest(withSearchText searchText: String) async throws -> Array<AGSSuggestResult> {
        try await AsyncOperation {
            self.suggest(withSearchText: searchText, completion: $0)
        }.call()
    }
    
    /** Suggest address with parameters and returns possible variants.
    
     Geocoding suggestions provide a mechanism for implementing character-by-character auto-complete.
     Using a text input and optional @c AGSSuggestParameters, suggested addresses can be quickly found and
     presented to the user. Suggestions are not limited to addresses, they can also be used for POIs
     (Points of Interest). To return a focused set of suggestions, set the @c AGSSuggestParameters#preferredSearchLocation
     or the @c AGSSuggestParameters#searchArea. Using the @c AGSSuggestParameters#preferredSearchLocation is
     similar to how ArcGIS Pro limits the suggestions returned.
     @param searchText Part of address text.
     @param parameters Suggest method parameters.
     @see @c Future, @c AGSSuggestResult, @c NSArray
     */
    func suggest(withSearchText searchText: String, parameters: AGSSuggestParameters) async throws -> Array<AGSSuggestResult> {
        try await AsyncOperation {
            self.suggest(withSearchText: searchText, parameters: parameters, completion: $0)
        }.call()
    }
    
}

public extension AGSMap {
    
    /** Returns a list of all the @c AGSUtilityNamedTraceConfiguration objects referenced by 
     @c AGSUtilityNetwork's Map.
    
     An empty array will be returned if the @c AGSUtilityNetwork does not belong to the Map
     or if the Map does not contain any @c AGSUtilityNamedTraceConfiguration objects.
     @param utilityNetwork The @c AGSUtilityNetwork.
     @see @c AGSUtilityNamedTraceConfiguration
     */
    func namedTraceConfigurations(from utilityNetwork: AGSUtilityNetwork) async throws -> Array<AGSUtilityNamedTraceConfiguration> {
        try await AsyncOperation {
            self.namedTraceConfigurations(from: utilityNetwork, completion: $0)
        }.call()
    }
    
}

public extension AGSMapView {
    
    /** Change the map view to the viewpoint with duration and animation curve asynchronously.
     @param viewpoint The viewpoint.
     @param durationSeconds The duration in seconds.
     @param curve The animation curve.
     */
    @discardableResult func setViewpoint(_ viewpoint: AGSViewpoint, duration: Double, curve: AGSAnimationCurve) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpoint(viewpoint, duration: duration, curve: curve, completion: $0)
        }.call()
    }
    
    /** Change the map view to the center point asynchronously.
     @param center The point to move the center of the map too.
     */
    @discardableResult func setViewpointCenter(_ center: AGSPoint) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointCenter(center, completion: $0)
        }.call()
    }
    
    /** Change the map view to the center point and scale asynchronously.
     @param center The point to move the center of the map too.
     @param scale The scale to change too.
     */
    @discardableResult func setViewpointCenter(_ center: AGSPoint, scale: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointCenter(center, scale: scale, completion: $0)
        }.call()
    }
    
    /** Change the map view to the bounding geometry asynchronously.
     @param boundingGeometry The bounding geometry to change too.
     */
    @discardableResult func setViewpointGeometry(_ boundingGeometry: AGSGeometry) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointGeometry(boundingGeometry, completion: $0)
        }.call()
    }
    
    /** Change the map view to the bounding geometry with padding asynchronously.
     @param boundingGeometry The bounding geometry to change too.
     @param paddingInDIPs The space in DIPs to expand the viewport by.
     */
    @discardableResult func setViewpointGeometry(_ boundingGeometry: AGSGeometry, padding: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointGeometry(boundingGeometry, padding: padding, completion: $0)
        }.call()
    }
    
    /** Rotates the map view to the provided angle asynchronously.
     @param angleDegrees An angular value, in degrees.
     */
    @discardableResult func setViewpointRotation(_ angleDegrees: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointRotation(angleDegrees, completion: $0)
        }.call()
    }
    
    /** Change the map view to zoom to a scale asynchronously.
     @param scale The scale to zoom too.
     */
    @discardableResult func setViewpointScale(_ scale: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointScale(scale, completion: $0)
        }.call()
    }
    
}

public extension AGSMobileMapPackage {
    
    /** Unpacks a mobile map package file (.mmpk) to an output directory.
    
     If the last level of the output_directory is not present, it will be created as part of the unpack task.
     The returned task can be canceled with @c Future#cancel to abort the unpack.
     The unpack task writes the full content of the mobile map package to the output directory. Care should be taken on
     devices with limited storage space, especially if the original package is very large. After unpacking, you can
     remove the original .mmpk file from the device.
    
     Note that unpacking will fail if the package is expired and was authored as @c AGSExpirationTypePreventExpiredAccess.
     @param mobileMapPackageFileURL the path to a mobile map package file (.mmpk)
     @param outputDirectory a path to a directory to write the mobile map package contents.
     */
    static func unpack(atFileURL fileURL: URL, outputDirectory: URL) async throws {
        try await AsyncOperation {
            AGSMobileMapPackage.unpack(atFileURL: fileURL, outputDirectory: outputDirectory, completion: $0)
        }.call()
    }
    
}

public extension AGSMobileScenePackage {
    
    /** Unpacks a mobile scene package file (.mspk) to an output directory.
    
     If the last level of the output_directory is not present, it will be created as part of the unpack task.
     The returned task can be canceled with @c Future#cancel to abort the unpack.
     The unpack task writes the full content of the mobile scene package to the output directory. Care should 
     be taken on devices with limited storage space, especially if the package is very large. After unpacking, 
     you can remove the original .mspk file from the device.
    
     Note that unpacking will fail if the package has expired and was authored as 
     @c AGSExpirationTypePreventExpiredAccess.
     @param mobileScenePackageFileURL the path to a mobile scene package file (.mspk)
     @param outputDirectory a path to a directory to write the mobile scene package contents.
     */
    static func unpack(atFileURL fileURL: URL, outputDirectory: URL) async throws {
        try await AsyncOperation {
            AGSMobileScenePackage.unpack(atFileURL: fileURL, outputDirectory: outputDirectory, completion: $0)
        }.call()
    }
    
}

public extension AGSMosaicDatasetRaster {
    
    /** Adds rasters to mosaic dataset raster.
     @param parameters The add rasters parameters object.
     */
    func addRasters(_ parameters: AGSAddRastersParameters) async throws {
        try await AsyncOperation {
            self.addRasters(parameters, completion: $0)
        }.call()
    }
    
}

public extension AGSOfflineMapSyncTask {
    
    /** Returns a @c Future of @c AGSOfflineMapUpdatesInfo for the offline map that was used to construct this task.
    
     The returned @c AGSOfflineMapUpdatesInfo provides high level information on what updates
     are available for this offline map. Information is provided on:
     * Online changes that can be applied to update your offline map
     * Local changes from your offline map that can be sent back to the online services
    
     Calling this method provides high-level information on the available updates. It can
     help you to determine whether to call @c AGSOfflineMapSyncTask#offlineMapSyncJobWithParameters:
     immediately, based upon factors such as current disk space and network availability.
     Examine these properties before starting the potentially time-consuming offline map
     sync process.
    
     The resulting @c AGSOfflineMapUpdatesInfo provides a snap-shot of available updates when
     this method was called.
    
     To check for new updates you need to call this method again.
     */
    func checkForUpdates() async throws -> AGSOfflineMapUpdatesInfo {
        try await AsyncOperation {
            self.checkForUpdates(completion: $0)
        }.call()
    }
    
    /** Returns a @c Future of @c AGSOfflineMapSyncParameters for the map that was used to construct this task.
    
     The parameters will be pre-populated with values appropriate for updating the
     feature data in this offline map.
    
     The default parameters will reflect the mobile geodatabases used by the offline map.
     */
    func defaultOfflineMapSyncParameters() async throws -> AGSOfflineMapSyncParameters {
        try await AsyncOperation {
            self.defaultOfflineMapSyncParameters(completion: $0)
        }.call()
    }
    
}

public extension AGSOfflineMapTask {
    
    /** Returns a @c Future of @c AGSDownloadPreplannedOfflineMapParameters created from the specified @c AGSPreplannedMapArea.
    
     A convenience method to create @c AGSDownloadPreplannedOfflineMapParameters with default values
     appropriate for taking the specified map area offline.
    
     The parameters will be populated using the values in the online map's
     @c AGSOfflineSettings (if present).
     @param preplannedMapArea the preplanned region of the online map that is to be taken offline.
     */
    func defaultDownloadPreplannedOfflineMapParameters(with preplannedMapArea: AGSPreplannedMapArea) async throws -> AGSDownloadPreplannedOfflineMapParameters {
        try await AsyncOperation {
            self.defaultDownloadPreplannedOfflineMapParameters(with: preplannedMapArea, completion: $0)
        }.call()
    }
    
    /** Returns a @c Future of @c AGSGenerateOfflineMapParameters created from the specified area of interest.
    
     The supported geometry types for the area of interest are @c AGSEnvelope and @c AGSPolygon.
     The area of interest must have a spatial reference.
    
     Where an @c AGSPolygon is supplied, features and tiles will be filtered according to the
     polygon geometry, which can help reduce the size of the resulting offline map. Note
     that the filtered set of tiles may vary, depending on the the underlying service.
    
     The returned parameters min scale and max scale are zero so data will be taken at the
     full range of scales the services support.
    
     The returned @c AGSGenerateOfflineMapParameters has its itemInfo property initialized
     from the offline map task's portal item, if that is set.
    
     The ItemInfo's thumbnail will be copied from the portal item's thumbnail.
    
     The default parameters will be populated using the values in the online map's
     @c AGSOfflineSettings (if present).
     @param areaOfInterest the region of the online map that is to be taken offline.
     */
    func defaultGenerateOfflineMapParameters(withAreaOfInterest areaOfInterest: AGSGeometry) async throws -> AGSGenerateOfflineMapParameters {
        try await AsyncOperation {
            self.defaultGenerateOfflineMapParameters(withAreaOfInterest: areaOfInterest, completion: $0)
        }.call()
    }
    
    /** Returns a @c Future of @c AGSGenerateOfflineMapParameters created from the specified area of interest, min scale and max scale.
     @param areaOfInterest The region of the online map that is to be taken offline. Sets the property @c AGSGenerateOfflineMapParameters#areaOfInterest.
     @param minScale Yhe minimum scale for offline tile caches. Use 0 for all far out levels. See the property @c AGSGenerateOfflineMapParameters#minScale.
     @param maxScale The maximum scale for offline tile caches. Use 0 for closer in detailed levels. Sets the property @c AGSGenerateOfflineMapParameters#maxScale.
     */
    func defaultGenerateOfflineMapParameters(withAreaOfInterest areaOfInterest: AGSGeometry, minScale: Double, maxScale: Double) async throws -> AGSGenerateOfflineMapParameters {
        try await AsyncOperation {
            self.defaultGenerateOfflineMapParameters(withAreaOfInterest: areaOfInterest, minScale: minScale, maxScale: maxScale, completion: $0)
        }.call()
    }
    
    /** Returns a @c Future of @c AGSGenerateOfflineMapParameterOverrides created from the specified @c AGSGenerateOfflineMapParameters parameters.
    
     When the task completes the @c AGSGenerateOfflineMapParameterOverrides will be populated
     reflecting the values in the @c AGSGenerateOfflineMapParameters parameters. The overrides
     may be inspected and modified to change the offline data before passing onto creating a
     job with @c AGSOfflineMapTask#generateOfflineMapJobWithParameters:downloadDirectory:.
    
     If there are errors with loading individual layers or tables, or they cannot be taken
     offline due to service settings, the outcome depends on the value of
     @c AGSGenerateOfflineMapParameters#continueOnErrors.
    
     If @c AGSGenerateOfflineMapParameters#continueOnErrors is @c YES, the overrides correspond
     to the remaining layers and tables that can go offline.
    
     The resulting offline map will not contain the layers or tables which had errors.
    
     If @c AGSGenerateOfflineMapParameters#continueOnErrors is @c NO, the returned
     @c Future will complete containing an @c NSError in the @c Future#error property
     from the failed layer or table.
    
     To check upfront which layers or tables are valid for taking offline see
     @c AGSOfflineMapTask#offlineMapCapabilitiesWithParameters:completion:.
    
     If @c AGSGenerateOfflineMapParameters#referenceBasemapDirectory is set, the overrides
     corresponding to online basemap layers will be omitted, since no basemap layers will be
     downloaded.
     @param parameters The generate offline map parameters from which the overrides will be populated.
     */
    func generateOfflineMapParameterOverrides(with parameters: AGSGenerateOfflineMapParameters) async throws -> AGSGenerateOfflineMapParameterOverrides {
        try await AsyncOperation {
            self.generateOfflineMapParameterOverrides(with: parameters, completion: $0)
        }.call()
    }
    
    /** Returns an async @c Future which, when successful, returns the @c AGSOfflineMapCapabilities containing information on which layers will be included in an offline map.
     @param parameters The parameters for taking a map offline.
     */
    func getOfflineMapCapabilities(with parameters: AGSGenerateOfflineMapParameters) async throws -> AGSOfflineMapCapabilities {
        try await AsyncOperation {
            self.getOfflineMapCapabilities(with: parameters, completion: $0)
        }.call()
    }
    
    /** Returns an async @c Future which when successful, contains a list of preplanned map areas, if there are any.
    
     Note that calling this method will load the OfflineMapTask if it is not already loaded.
     */
    func getPreplannedMapAreas() async throws -> Array<AGSPreplannedMapArea> {
        try await AsyncOperation {
            self.getPreplannedMapAreas(completion: $0)
        }.call()
    }
    
}

public extension AGSOGCFeatureCollectionTable {
    
    /** Populate the OGC API - Features feature collection table with the results of a query.
    
     Use the default (empty) @c AGSQueryParameters to get all features from the service.
     Specifying @c nil or an empty @c NSMutableArray for \p outfields will result in the default set of outfields being used.
     Spatial queries (those that specify geometries) must use the Intersects spatial relationship.
     @param parameters Parameters that define how features are returned from the service.
     @param clearCache If @c YES, clears existing table data before populating it with features returned from the service.
     @param outfields An @c NSMutableArray containing @c NSString.
     */
    func populateFromService(with parameters: AGSQueryParameters, clearCache: Bool, outfields: Array<String>) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.populateFromService(with: parameters, clearCache: clearCache, outfields: outfields, completion: $0)
        }.call()
    }
    
}

public extension AGSOrbitGeoElementCameraController {
    
    /** Animate the camera to the new position relative to the target.
     @param distanceDelta The change in distance to apply in the animation.
     @param headingDelta The change in heading to apply in the animation.
     @param pitchDelta The change in pitch to apply in the animation.
     @param duration The duration of the animation in seconds.
     */
    @discardableResult func moveCamera(withDistanceDelta distanceDelta: Double, headingDelta: Double, pitchDelta: Double, duration: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.moveCamera(withDistanceDelta: distanceDelta, headingDelta: headingDelta, pitchDelta: pitchDelta, duration: duration, completion: $0)
        }.call()
    }
    
    /** Animate the camera target offsets of the camera.
    
     By default the camera focus's on the graphic geometry center point.  Using the offsets you can move the focal
     point to a new position relative to that center point.
     @param x The change x offset symbol center.
     @param y The change y offset symbol center.
     @param z The change z offset symbol center.
     @param duration The duration of the animation in seconds.
     */
    @discardableResult func setTargetOffsetX(_ x: Double, targetOffsetY: Double, targetOffsetZ: Double, duration: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setTargetOffsetX(x, targetOffsetY: targetOffsetY, targetOffsetZ: targetOffsetZ, duration: duration, completion: $0)
        }.call()
    }
    
}

public extension AGSOrbitLocationCameraController {
    
    /** Animate the camera to the new position relative to the target.
     @param distanceDelta The change in distance to apply in the animation.
     @param headingDelta The change in heading to apply in the animation.
     @param pitchDelta The change in pitch to apply in the animation.
     @param duration The duration of the animation in seconds.
     */
    @discardableResult func moveCamera(withDistanceDelta distanceDelta: Double, headingDelta: Double, pitchDelta: Double, duration: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.moveCamera(withDistanceDelta: distanceDelta, headingDelta: headingDelta, pitchDelta: pitchDelta, duration: duration, completion: $0)
        }.call()
    }
    
}

public extension AGSPopup {
    
    /** Asynchronously evaluates all expressions, including Arcade FeatureSet functions, available at @c AGSPopupDefinition#expressions. 
     This method must be called before displaying the popup information in a UI so you can use synchronous methods 
     @c AGSPopup#formattedValueWithPopupField: and @c AGSPopup#substituteWithTemplatedString: to get the formatted @c NSString representation.
     If there are no @c AGSPopupDefinition#expressions then result array will be empty.
    
     The @c AGSPopupExpression may be used in the @c AGSPopupDefinition#fields, @c AGSPopupDefinition#media, @c AGSPopupDefinition#title 
     and @c AGSPopupDefinition#customDescription.
     */
    func evaluateExpressions() async throws -> Array<AGSPopupExpressionEvaluation> {
        try await AsyncOperation {
            self.evaluateExpressions(completion: $0)
        }.call()
    }
    
}

public extension AGSPortal {
    
    
    
    func fetchBasemaps() async throws -> Array<AGSBasemap> {
        try await AsyncOperation {
            self.fetchBasemaps(completion: $0)
        }.call()
    }
    
    /** Executes a portal query to fetch the developer basemaps for this portal.
    
     An @c AGSPortal instance may contain a set of associated basemaps, called developer basemaps, 
     which are accessible and metered via API keys.
     These are equivalent to basemaps constructed via an @c AGSBasemapStyle.
     @see @c AGSPortalInfo#developerBasemapGalleryGroupQuery, @c AGSBasemap#initWithStyle:
     */
    func fetchDeveloperBasemaps() async throws -> Array<AGSBasemap> {
        try await AsyncOperation {
            self.fetchDeveloperBasemaps(completion: $0)
        }.call()
    }
    
    /** Executes a portal query to fetch the featured groups for the organization.
     */
    func fetchFeaturedGroups() async throws -> Array<AGSPortalGroup> {
        try await AsyncOperation {
            self.fetchFeaturedGroups(completion: $0)
        }.call()
    }
    
    
    
    func fetchFeaturedItems() async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.fetchFeaturedItems(completion: $0)
        }.call()
    }
    
    
    
    func fetchHomePageFeaturedContent() async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.fetchHomePageFeaturedContent(completion: $0)
        }.call()
    }
    
    /** Executes a portal query that gets the current user's @c AGSLicenseInfo including the entitlements and extensions.
     */
    func fetchLicenseInfo() async throws -> AGSLicenseInfo {
        try await AsyncOperation {
            self.fetchLicenseInfo(completion: $0)
        }.call()
    }
    
    /** Executes a portal query with the @c AGSPortalInfo#stylesGroupQuery query string.
     */
    func fetchStyles() async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.fetchStyles(completion: $0)
        }.call()
    }
    
    /** Executes a portal query with the @c AGSPortalInfo#symbolSetsGroupQuery query string.
     */
    func fetchSymbolSets() async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.fetchSymbolSets(completion: $0)
        }.call()
    }
    
    /** Executes a portal query with the @c AGSPortalInfo#vectorBasemapGalleryGroupQuery query string.
     */
    func fetchVectorBasemaps() async throws -> Array<AGSBasemap> {
        try await AsyncOperation {
            self.fetchVectorBasemaps(completion: $0)
        }.call()
    }
    
    /** Finds portal groups that match the given query parameters.
    
     The resultant @c AGSPortalGroup objects are fully populated and have a load status of @c AGSLoadStatusLoaded.
     @param queryParams the query parameters
     */
    func findGroups(with queryParams: AGSPortalQueryParameters) async throws -> AGSPortalQueryResultSet {
        try await AsyncOperation {
            self.findGroups(with: queryParams, completion: $0)
        }.call()
    }
    
    /** Finds portal items that match the given query parameters.
    
     If you are considering using this method to find items that belong to a group, see 
     @c AGSPortalGroup#findItemsWithSearchParams:completion: for a description of how that method, which uses a Group Content Search 
     operation that's designed specifically for finding items that belong to a group, differs from this method
     which uses a general-purpose Search operation.
     @param queryParams the query parameters
     */
    func findItems(with queryParams: AGSPortalQueryParameters) async throws -> AGSPortalQueryResultSet {
        try await AsyncOperation {
            self.findItems(with: queryParams, completion: $0)
        }.call()
    }
    
}

public extension AGSPortalItem {
    
    
    
    func addComment(_ comment: String) async throws -> AGSPortalItemComment {
        try await AsyncOperation {
            self.addComment(comment, completion: $0)
        }.call()
    }
    
    
    
    func addRating(_ rating: Double) async throws {
        try await AsyncOperation {
            self.addRating(rating, completion: $0)
        }.call()
    }
    
    
    
    func fetchComments() async throws -> Array<AGSPortalItemComment> {
        try await AsyncOperation {
            self.fetchComments(completion: $0)
        }.call()
    }
    
    /** Fetches the groups this portal item belongs to.
    
     Only those groups that are visible to the current portal user will be returned.
     */
    func fetchGroups() async throws -> ([AGSPortalGroup]?, [AGSPortalGroup]?, [AGSPortalGroup]?) {
        try await AsyncOperationThreeSuccesses {
            self.fetchGroups(completion: $0)
        }.call()
    }
    
    /** Fetches all related portal items with any of the specified relationships to this portal item.
     @param relationships A collection of relationships.
     @param direction The direction of the relationships.
     */
    func fetchRelatedItems(withRelationships relationships: [NSValue], direction: AGSPortalItemRelationshipDirection) async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.fetchRelatedItems(withRelationships: relationships, direction: direction, completion: $0)
        }.call()
    }
    
    /** Fetches all related portal items with the specified relationship to this portal item.
     @param relationship The relationship.
     @param direction The direction of the relationship.
     */
    func fetchRelatedItems(with relationship: AGSPortalItemRelationship, direction: AGSPortalItemRelationshipDirection) async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.fetchRelatedItems(with: relationship, direction: direction, completion: $0)
        }.call()
    }
    
    
    
    func share(withEveryone everyone: Bool, org: Bool) async throws {
        try await AsyncOperation {
            self.share(withEveryone: everyone, org: org, completion: $0)
        }.call()
    }
    
    /** Shares this PortalItem with the specified portal groups.
    
     It's not necessary to load the @c AGSPortalGroup objects that are passed to this method.
     @param groups the groups to be shared with.
     */
    func share(with groups: Array<AGSPortalGroup>) async throws -> Array<AGSPortalGroup> {
        try await AsyncOperation {
            self.share(with: groups, completion: $0)
        }.call()
    }
    
    
    
    func unshare() async throws {
        try await AsyncOperation {
            self.unshare(completion: $0)
        }.call()
    }
    
    /** Stops sharing this PortalItem with the specified list of portal groups.
    
     It's not necessary to load the @c AGSPortalGroup objects that are passed to this method.
     @param groups the groups to stop sharing with.
     */
    func unshare(with groups: Array<AGSPortalGroup>) async throws -> Array<AGSPortalGroup> {
        try await AsyncOperation {
            self.unshare(with: groups, completion: $0)
        }.call()
    }
    
    
    
    func update(_ data: Data) async throws {
        try await AsyncOperation {
            self.update(data, completion: $0)
        }.call()
    }
    
    
    
    func updateData(withJSON JSON: String) async throws {
        try await AsyncOperation {
            self.updateData(withJSON: JSON, completion: $0)
        }.call()
    }
    
}

public extension AGSPreplannedMapArea {
    
    /** Returns an async @c Future which when successful, contains a list of content items for this preplanned map area,
     if there are any. The content items will be cached so the same instances will be returned with each subsequent call
     of this method.
     */
    func getContentItems() async throws -> Array<AGSPortalItem> {
        try await AsyncOperation {
            self.getContentItems(completion: $0)
        }.call()
    }
    
}

public extension AGSRouteTask {
    
    /** Creates default parameters.
    
     Generates default parameters.
     @see @c AGSRouteParameters, @c Future
     */
    func defaultRouteParameters() async throws -> AGSRouteParameters {
        try await AsyncOperation {
            self.defaultRouteParameters(completion: $0)
        }.call()
    }
    
    /** Imports route parameters from portal item and then adjusts imported parameters to current Route task.
    
     Travel mode would be @c nil if it could not be created from the route layer settings for the route task's network.
     In case if travel mode is @c nil then client can override it by another travel mode (for example obtained from @c AGSRouteTaskInfo).
     Accumulate attributes from Route Info table going to be applied only if they exist in transportation network restriction and cost attributes.
     @param portalItem The portal item object with feature collection that contains stops, route info, and barriers tables. Stops table is required.
     */
    func routeParameters(with portalItem: AGSPortalItem) async throws -> AGSRouteParameters {
        try await AsyncOperation {
            self.routeParameters(with: portalItem, completion: $0)
        }.call()
    }
    
    /** Imports route result from feature collection.
     @param collection The feature collection that contains directions, stops, route info, and barriers tables.
     */
    static func routeResult(with collection: AGSFeatureCollection) async throws -> AGSRouteResult {
        try await AsyncOperation {
            AGSRouteTask.routeResult(with: collection, completion: $0)
        }.call()
    }
    
    /** Imports route result from portal item.
     @param portalItem The portal item with feature collection that contains directions, stops, route info, and barriers tables.
     */
    static func routeResult(with portalItem: AGSPortalItem) async throws -> AGSRouteResult {
        try await AsyncOperation {
            AGSRouteTask.routeResult(with: portalItem, completion: $0)
        }.call()
    }
    
    /** Solves a route passing in a parameters object.
     @param routeParameters The route parameters.
     @see @c Future, @c AGSRouteParameters
     */
    func solveRoute(with routeParameters: AGSRouteParameters) async throws -> AGSRouteResult {
        try await AsyncOperation {
            self.solveRoute(with: routeParameters, completion: $0)
        }.call()
    }
    
}

public extension AGSRouteTracker {
    
    /** Enables automatic rerouting when the tracker detects an off-route status.
    
     Re-routing only occurs when the current location is off-route, but on or near the transportation network edges.
     For example if an off-route state is detected but the tracked location is in a parking lot, away from any transportation 
     network edges, re-routing will not occur, and will occur only once a subsequent tracked location is on or near the 
     transportation network edges.
     @param parameters An @c AGSReroutingParameters allow customizing background rerouting.
     */
    func enableRerouting(with parameters: AGSReroutingParameters) async throws {
        try await AsyncOperation {
            self.enableRerouting(with: parameters, completion: $0)
        }.call()
    }
    
    /** Starts tracking progress to the next destination in the @c AGSRoute.
    
     Use @c AGSRouteTracker#switchToNextDestinationWithCompletion: when the tracker reports an @c AGSDestinationStatusReached status.
     Before calling @c AGSRouteTracker#switchToNextDestinationWithCompletion: make sure that @c AGSTrackingStatus#remainingDestinationCount > 1
     (a value of 1 means navigation is proceeding to last destination). This method can also be called after 
     @c AGSDestinationStatusApproaching is raised in cases where the location cannot get near enough to the destination point
     for @c AGSDestinationStatusReached to be raised (such as the center of a park or shopping center, for example).
     @c AGSRouteTracker#trackLocation:completion: needs to be called at least once before calling this method otherwise an error will be thrown.
     @c AGSRouteTracker#trackLocation:completion: is needed for getting @c AGSTrackingStatus and for handling visitFirstStopOnStart.
     */
    func switchToNextDestination() async throws {
        try await AsyncOperation {
            self.switchToNextDestination(completion: $0)
        }.call()
    }
    
    /** Provides route tracking status relative to the provided location.
    
     The location generally comes from a GPS but may also be a simulated or manually entered location.
     It must have valid values for X and Y coordinates, speed (in meters per second), course (in degrees),
     and a timestamp.
     Events fired for @c AGSRouteTracker when completed.
     @param location A location used to evaluate status and progress along the route.
     @see @c AGSLocation
     */
    func trackLocation(_ location: AGSLocation) async throws {
        try await AsyncOperation {
            self.trackLocation(location, completion: $0)
        }.call()
    }
    
}

public extension AGSSceneView {
    
    /** Converts a screen coordinate to a coordinate within the scene view's spatial reference asynchronously.
     @param screen The screen point.
     */
    func screen(toLocation location: CGPoint) async -> AGSPoint {
        await AsyncOperationNoThrow {
            self.screen(toLocation: location, completion: $0)
        }.call()
    }
    
    /** Change the Scene view to the new camera viewpoint asynchronously.
     @param camera The camera.
     */
    @discardableResult func setViewpointCamera(_ camera: AGSCamera) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointCamera(camera, completion: $0)
        }.call()
    }
    
    /** Change the Scene view to the new camera viewpoint asynchronously using the specified duration to arrive.
     @param camera The camera.
     @param duration The duration in seconds to move the to new camera location, must be greater or equal.
     */
    @discardableResult func setViewpointCamera(_ camera: AGSCamera, duration: Double) async -> Bool {
        await AsyncOperationNoThrow {
            self.setViewpointCamera(camera, duration: duration, completion: $0)
        }.call()
    }
    
}

public extension AGSServiceAreaTask {
    
    /** Creates default parameters.
    
     Retrieves the default parameters as defined by the service.
     @see @c AGSServiceAreaParameters, @c Future
     */
    func defaultServiceAreaParameters() async throws -> AGSServiceAreaParameters {
        try await AsyncOperation {
            self.defaultServiceAreaParameters(completion: $0)
        }.call()
    }
    
    /** Solve a service area passing in a parameters object.
    
     Executes the @c AGSServiceAreaParameters defined for this @c AGSServiceAreaTask
     and returns an @c AGSServiceAreaResult containing the results.
     @param serviceAreaParameters The service area parameters.
     @see @c Future, @c AGSServiceAreaParameters
     */
    func solveServiceArea(with serviceAreaParameters: AGSServiceAreaParameters) async throws -> AGSServiceAreaResult {
        try await AsyncOperation {
            self.solveServiceArea(with: serviceAreaParameters, completion: $0)
        }.call()
    }
    
}

public extension AGSServiceFeatureTable {
    
    /** Uploads any changes to the local table to the feature service.
    
     @c AGSServiceFeatureTable#applyEditsWithCompletion: is meant to be used for single table workflows or tables without
     database behavior (see below). If an edit on this table can cause an edit to another table due to database 
     behavior, it is highly recommended to use @c AGSServiceGeodatabase#applyEditsWithCompletion: instead to prevent data 
     inconsistency, so that dependent edits are all applied or none are (if an error occurs).
    
     For example, when tables have a composite relationship, applying the delete of a destination feature 
     in a composite relationship deletion will only delete the destination feature on the server, therefore 
     causing inconsistency in the data.
    
     Areas which have database behavior:
     * Composite relationships
     * Annotation feature layers
     * Utility network association deletion semantics
     * Attribute rules
     @see @c AGSFeatureServiceSessionType
     */
    func applyEdits() async throws -> Array<AGSFeatureEditResult> {
        try await AsyncOperation {
            self.applyEdits(completion: $0)
        }.call()
    }
    
    /** Loads all attributes and geometries for not loaded features, and refetches attributes and geometries for previously loaded features. All features loaded or refreshed by this method will have m-values if defined by the service. Note that an m-value might be NaN.
    
     Features you get from @c AGSServiceFeatureTable#queryFeaturesWithParameters:queryFeatureFields:completion: or @c AGSServiceFeatureTable#queryRelatedFeaturesWithFeature:parameters:queryFeatureFields:completion: might be in the minimally loaded state (minimum attributes required for rendering and no m-values). To load all attributes, pass a mutable array of the features to this method. 
    
     Any feature requested, but not returned, by the server will have its object id cleared (set to an invalid negative value) to indicate it is no longer associated with the service feature table.
    
     After calling this method, any non-applied edits on the table will be lost.
    
     This method will not refresh feature attachments. Use @c AGSArcGISFeature#fetchAttachmentsWithCompletion: to retrieve attachments.
     @param features An @c NSMutableArray of @c AGSFeature.
     */
    func loadOrRefreshFeatures(_ features: [AGSArcGISFeature]) async throws {
        try await AsyncOperation {
            self.loadOrRefreshFeatures(features, completion: $0)
        }.call()
    }
    
    /** Queries the feature service and places the resulting features in the local table, which is cached for the duration of the session. The @c AGSServiceFeatureTable must have its @c AGSServiceFeatureTable#featureRequestMode set to @c AGSFeatureRequestModeManualCache.
    
     This method is useful for non-geographic data. It's also helpful when you want to avoid accessing the service for a feature whose geometry is in the current extent of the map or scene.
    
     Specifying @c nil or an empty @c NSMutableArray for outfields results in the minimum set of fields being used when populating the local table. This is the same set of attributes described for @c AGSFeatureRequestModeOnInteractionCache or @c AGSFeatureRequestModeOnInteractionNoCache.
     @param parameters Options for controlling the operation.
     @param clearCache If @c YES, then @c AGSServiceFeatureTable#clearCacheWithKeepLocalEdits: will be called before populating the local table. If @c NO, the resulting features will be appended to the local table.
     @param outfields An @c NSMutableArray containing @c NSString. Each string is the name of a field to be used when populating the cache. If the array contains the single element "*", then all fields will be used. If the ObjectID field string name is not provided as part of the @c NSMutableArray, no features will be returned for this method.
     @see @c AGSFeatureServiceSessionType
     */
    func populateFromService(with parameters: AGSQueryParameters, clearCache: Bool, outFields: [String]) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.populateFromService(with: parameters, clearCache: clearCache, outFields: outFields, completion: $0)
        }.call()
    }
    
    /** Queries features from this table's cache and/or from the feature service used to create this table.
    
     If the request mode of the table is @c AGSFeatureRequestModeManualCache, then the query
     is always performed on the local table. 
    
     If the mode is @c AGSFeatureRequestModeOnInteractionCache, then the query is performed
     on the local cache, provided that the geometries of the features are within an extent
     that has been cached; otherwise, the query is performed on the server. 
    
     If the mode is @c AGSFeatureRequestModeOnInteractionNoCache, the query is always
     performed on the server.
    
     The @c AGSQueryFeatureFields constants control which fields will be included with the
     returned features. The option include:
     * A table whose feature request mode is manualCache contains all fields that you
       specified when calling
       @c AGSServiceFeatureTable#populateFromServiceWithParameters:clearCache:outfields:completion:
     * A table whose feature request mode is onInteractionCache or onInteractionNoCache
       initially contains features with a minimum set of attribute required for rendering.
       You must load a feature to access all its attributes. The convenience constant
       @c AGSQueryFeatureFieldsLoadAll automatically loads the returned features into the
       local table, which makes all attributes available.
    
     Note that you can query on any attribute defined by the feature service's table. If the
     attribute is not in the minimum set of attributes in your local table, the query will
     be performed on the server.
     @param parameters Options for controlling the operation.
     @param queryFeatureFields Options for controlling what fields are in the features of the query result.
     @see @c AGSFeatureServiceSessionType
     */
    func queryFeatures(with parameters: AGSQueryParameters, queryFeatureFields: AGSQueryFeatureFields) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.queryFeatures(with: parameters, queryFeatureFields: queryFeatureFields, completion: $0)
        }.call()
    }
    
    /** Queries for related features in this service feature table using the provided parameters and query feature fields. See @c AGSServiceFeatureTable#queryFeaturesWithParameters:queryFeatureFields:completion: for more details.
     @param feature The feature for which to query related features.
     @param parameters The related query parameters.
     @param queryFeatureFields Enumeration indicating which fields to return from the query.
     @see @c AGSFeatureServiceSessionType
     */
    func queryRelatedFeatures(for feature: AGSArcGISFeature, parameters: AGSRelatedQueryParameters, queryFeatureFields: AGSQueryFeatureFields) async throws -> [AGSRelatedFeatureQueryResult] {
        try await AsyncOperation {
            self.queryRelatedFeatures(for: feature, parameters: parameters, queryFeatureFields: queryFeatureFields, completion: $0)
        }.call()
    }
    
    /** Undoes all of the local edits since the last server acknowledgment.
    
     @c AGSServiceFeatureTable#undoLocalEditsWithCompletion: is meant to be used for single table workflows or tables without
     database behavior (see below). If the service which the table belongs to has database behavior (see below), 
     it is highly recommended to use @c AGSServiceGeodatabase#undoLocalEditsWithCompletion:. Undoing edits in one table 
     can cause data inconsistencies between the local cache and the service if 
     @c AGSServiceFeatureTable#undoLocalEditsWithCompletion: is used.
    
     For example, when tables have a composite relationship, undoing only the origin feature would violate the 
     composite relationship rule that an origin and destination feature must be either deleted together or not 
     at all.
    
     Areas which have database behavior:
     * Composite relationships
     * Annotation feature layers
     * Utility network association deletion semantics
     * Attribute rules
     @see @c AGSFeatureServiceSessionType
     */
    func undoLocalEdits() async throws {
        try await AsyncOperation {
            self.undoLocalEdits(completion: $0)
        }.call()
    }
    
}

public extension AGSServiceGeodatabase {
    
    /** Applies all local edits in all tables to the service.
    
     Edits in all tables are applied to the feature service in a call,
     which is more efficient than doing so one @c AGSServiceFeatureTable at
     a time.
     @see @c AGSFeatureServiceSessionType
     */
    func applyEdits() async throws -> Array<AGSFeatureTableEditResult> {
        try await AsyncOperation {
            self.applyEdits(completion: $0)
        }.call()
    }
    
    /** Closes this service geodatabase.
    
     A request to stop any active reading or editing sessions with the feature service is sent and once this asynchronous process is complete, 
     this service geodatabase will be closed.
    
     Before calling this method, there should be no references to all related data. For example, terminate fetch versions, 
     create version, switch, apply or undo edits, remove feature layers, and release tables from map.
    
     After calling this method, accessing this service geodatabase or any of its connected tables will fail 
     with @c AGSErrorCodeGDBDatabaseClosed.
    
     Closing this service geodatabase is not necessary if it has not been loaded.
     */
    func close() async throws {
        try await AsyncOperation {
            self.close(completion: $0)
        }.call()
    }
    
    /** Creates a new version in the service based on the default version.
    
     Branch versioning requires that the default version always be the
     ancestor of all other versions.
    
     If the service isn't branch versioned, an
     @c AGSErrorCodeMappingBranchVersioningNotSupportedByService is thrown.
    
     If the version parameters do not include a name, an error is thrown.
     @param parameters The properties of the new version.
     */
    func createVersion(with parameters: AGSServiceVersionParameters) async throws -> AGSServiceVersionInfo {
        try await AsyncOperation {
            self.createVersion(with: parameters, completion: $0)
        }.call()
    }
    
    /** Gets a list of all versions on the service.
    
     If the service isn't branch versioned, an
     @c AGSErrorCodeMappingBranchVersioningNotSupportedByService is thrown.
     */
    func fetchVersions() async throws -> Array<AGSServiceVersionInfo> {
        try await AsyncOperation {
            self.fetchVersions(completion: $0)
        }.call()
    }
    
    /** Switches all connected feature tables to the new version.
    
     An error is thrown if:
     * The service isn't branch versioned
     * No version exists with the supplied name
     * Any of the @c AGSServiceGeodatabase#connectedTables have unapplied edits
    
     Check the result of @c AGSServiceGeodatabase#hasLocalEdits before
     attempting to switch versions, to make sure all changes are saved to
     the service or discarded from the local cache.  Use the
     @c AGSServiceGeodatabase#applyEditsWithCompletion: or
     @c AGSServiceGeodatabase#undoLocalEditsWithCompletion: methods as appropriate
     to save or discard changes before switching versions.
     @param versionName The name of the version to connect to.
     */
    func switchVersion(withName name: String) async throws {
        try await AsyncOperation {
            self.switchVersion(withName: name, completion: $0)
        }.call()
    }
    
    /** Undos all of the local edits in all the tables.
     @see @c AGSFeatureServiceSessionType
     */
    func undoLocalEdits() async throws {
        try await AsyncOperation {
            self.undoLocalEdits(completion: $0)
        }.call()
    }
    
}

public extension AGSSurface {
    
    /** Gets the best available elevation from the elevation surface.
     @param point The point to find the elevation for.
     */
    func elevation(for point: AGSPoint) async throws -> Double {
        try await AsyncOperation {
            self.elevation(for: point, completion: $0)
        }.call()
    }
    
}

public extension AGSSymbol {
    
    /** Creates a swatch of the symbol.
     @param backgroundColor The background color of the swatch. Can be @c nil, in which case a transparent background is used.
     @param screenScale The number of pixels per DIP (sometimes referred to as screen density or device pixel ratio).  <b>NOTE: This parameter should not be exposed publicly.</b>
     */
    func createSwatch(withBackgroundColor backgroundColor: UIColor, screen: UIScreen) async throws -> UIImage {
        try await AsyncOperation {
            self.createSwatch(withBackgroundColor: backgroundColor, screen: screen, completion: $0)
        }.call()
    }
    
    /** Creates a swatch of the symbol.
    
     This method will scale the symbol up or down in order to fit it in to the desired width and height of the swatch.
     @param width The width of the swatch.
     @param height The height of the swatch.
     @param screenScale The number of pixels per DIP (sometimes referred to as screen density or device pixel ratio). This value is used to scale symbology when rendering the swatch. The value should be set appropriately  in order to render swatches at the correct scale for a given display. Note: Picture marker symbols  without a set width or height are not scaled by screen scale, as unset width and height are taken  to mean "render at native pixel scale".
     @param backgroundColor The background color of the swatch. Can be @c nil, in which case a transparent background is used.
     */
    func createSwatch(withWidth width: Int, height: Int, screen: UIScreen, backgroundColor: UIColor) async throws -> UIImage {
        try await AsyncOperation {
            self.createSwatch(withWidth: width, height: height, screen: screen, backgroundColor: backgroundColor, completion: $0)
        }.call()
    }
    
    /** Creates a swatch of the symbol.
     @param width The width of the swatch.
     @param height The height of the swatch.
     @param screenScale The number of pixels per DIP (sometimes referred to as screen density or device pixel ratio). This value is used to scale symbology when rendering the swatch. The value should be set appropriately  in order to render swatches at the correct scale for a given display. Note: Picture marker symbols  without a set width or height are not scaled by screen scale, as unset width and height are taken  to mean "render at native pixel scale".
     @param backgroundColor The background color of the swatch. Can be @c nil, in which case a transparent background is used.
     @param geometry The geometry of the symbol to be drawn in the swatch image. The specified geometry is in DIPs, with the point {0,0} located at the center of the swatch image. The X-axis increases towards the right  side of the swatch image. The Y-axis increases towards the top of the swatch image. For example:  when creating a swatch for an @c AGSMarkerSymbol, specifying a geometry of {10,10} will draw the marker  10 DIPs up and to the right of the center of the swatch. The geometry type (@c AGSPoint, @c AGSPolyline,  @c AGSPolygon) should correspond to the symbol type (@c AGSMarkerSymbol, @c AGSLineSymbol, @c AGSFillSymbol).  The geometry's spatial reference is ignored.
     */
    func createSwatch(with geometry: AGSGeometry, width: Int, height: Int, screen: UIScreen, backgroundColor: UIColor) async throws -> UIImage {
        try await AsyncOperation {
            self.createSwatch(with: geometry, width: width, height: height, screen: screen, backgroundColor: backgroundColor, completion: $0)
        }.call()
    }
    
}

public extension AGSSymbolStyle {
    
    /** Returns a Symbol Style Search Parameters object providing all available search parameters from the database.
    
     This asynchronous task retrieves all the valid input search parameters for a style.
     This means you get all of the possible input values for categories, keys,
     names, symbolClasses, and tags. This is an expensive task that should be used sparingly.
     */
    func defaultSearchParameters() async throws -> AGSSymbolStyleSearchParameters {
        try await AsyncOperation {
            self.defaultSearchParameters(completion: $0)
        }.call()
    }
    
    /** Asynchronously returns a symbol based on the provided list of keys.
    
     This function is useful for obtaining a single, multi-layer symbol from supplied
     keys. This is commonly used to create symbols and graphics on-the-fly. For
     example, assume XYZ style has a symbol with key "abc" which is the central symbol and another symbol with key "pqr",
     which could be the modifier/echelon placed at some offset from central geometry. So if you provide these two keys as attributes
     then symbol style will find and assemble a symbol accordingly.
     Once you have that symbol, you can apply it to a Graphic or Renderer,
     obtain its swatch image, or serialize to JSON.
     If the Symbol style is not loaded then starting this task will start the
     load cycle.
     @param keys @c NSMutableArray of @c NSString type value. It is the list of keys required to obtain a symbol from the style.
     */
    func symbol(forKeys keys: [String]) async throws -> AGSSymbol {
        try await AsyncOperation {
            self.symbol(forKeys: keys, completion: $0)
        }.call()
    }
    
    /** Returns a collection of Symbol Style Search Result object.
    
     This asynchronous task searches for symbol primitives in the symbol style. The
     input searchParameters define what is searched for. For example, you could search
     for all symbols that have the tag "airspace". You can also set the match to be strict
     or not, which will determine if the search uses "=" or "LIKE" for each parameter.
     @param searchParameters an object of type @c AGSSymbolStyleSearchParameters.
     */
    func searchSymbols(with searchParameters: AGSSymbolStyleSearchParameters) async throws -> Array<AGSSymbolStyleSearchResult> {
        try await AsyncOperation {
            self.searchSymbols(with: searchParameters, completion: $0)
        }.call()
    }
    
}

public extension AGSSymbolStyleSearchResult {
    
    /** Asynchronously returns a symbol from the search result.
     */
    func symbol() async throws -> AGSSymbol {
        try await AsyncOperation {
            self.symbol(completion: $0)
        }.call()
    }
    
}

public extension AGSUtilityNetwork {
    
    /** Returns a list of all @c AGSUtilityAssociation objects (with their geometry) present in the geodatabase for a given @c AGSEnvelope.
    
     The result is a list of connectivity and structural attachment associations.
     Containment associations are not returned because no geometric relationship is defined between a container and its contents.
     The method does not return a complete picture of connectivity; features that are connected by geometric coincidence are not returned. 
     Note that the list returned can contain associations that have not yet been validated and are therefore not yet included in the topological index.
     @param extent The @c AGSEnvelope that defines the area for which associations to return.
     */
    func associations(withExtent extent: AGSEnvelope) async throws -> Array<AGSUtilityAssociation> {
        try await AsyncOperation {
            self.associations(withExtent: extent, completion: $0)
        }.call()
    }
    
    /** Returns a list of all @c AGSUtilityAssociation objects (with their geometry) of type @c AGSUtilityAssociationType present in the geodatabase for a given @c AGSEnvelope.
    
     Containment associations are not returned because no geometric relationship is defined between a container and its contents; 
     consider using @c AGSUtilityNetwork#associationsWithElement:type:completion: instead.
     The method does not return a complete picture of connectivity; features that are connected by geometric coincidence are not returned. 
     Note that the list returned can contain associations that have not yet been validated and are therefore not yet included in the topological index.
     @param extent The @c AGSEnvelope that defines the area for which associations to return.
     @param type The @c AGSUtilityAssociationType of associations to return.
     */
    func associations(withExtent extent: AGSEnvelope, type: AGSUtilityAssociationType) async throws -> Array<AGSUtilityAssociation> {
        try await AsyncOperation {
            self.associations(withExtent: extent, type: type, completion: $0)
        }.call()
    }
    
    /** Returns a list of all @c AGSUtilityAssociation objects present in the geodatabase for a given @c AGSUtilityElement.
    
     The result is a list of all associations -- connectivity associations, containment associations, structural attachment associations -- that include the given @c AGSUtilityElement object. 
     The method does not return a complete picture of connectivity; features that are connected by geometric coincidence are not returned. 
     Note that the list returned can contain associations that have not yet been validated and are therefore not yet included in the topological index.
     @param element The @c AGSUtilityElement whose associations are to be returned.
     */
    func associations(with element: AGSUtilityElement) async throws -> Array<AGSUtilityAssociation> {
        try await AsyncOperation {
            self.associations(with: element, completion: $0)
        }.call()
    }
    
    /** Returns a list of all @c AGSUtilityAssociation objects of type @c AGSUtilityAssociationType present in the geodatabase for a given @c AGSUtilityElement.
    
     The method does not return a complete picture of connectivity; features that are connected by geometric coincidence are not returned. 
     Note that the list returned can contain associations that have not yet been validated and are therefore not yet included in the topological index.
     @param element The @c AGSUtilityElement whose associations are to be returned.
     @param type The @c AGSUtilityAssociationType of associations to return.
     */
    func associations(with element: AGSUtilityElement, type: AGSUtilityAssociationType) async throws -> Array<AGSUtilityAssociation> {
        try await AsyncOperation {
            self.associations(with: element, type: type, completion: $0)
        }.call()
    }
    
    /** Gets a collection of loaded @c AGSArcGISFeature objects that each
     correspond to one of a collection of @c AGSUtilityElement objects.
     @param elements The collection of utility elements used to find corresponding features.
     */
    func features(for elements: Array<AGSUtilityElement>) async throws -> Array<AGSArcGISFeature> {
        try await AsyncOperation {
            self.features(for: elements, completion: $0)
        }.call()
    }
    
    /** Returns a list of @c AGSUtilityNamedTraceConfiguration from the utility network.
     @see @c AGSUtilityNamedTraceConfigurationQueryParameters
     */
    func queryNamedTraceConfigurations(with queryParameters: AGSUtilityNamedTraceConfigurationQueryParameters) async throws -> Array<AGSUtilityNamedTraceConfiguration> {
        try await AsyncOperation {
            self.queryNamedTraceConfigurations(with: queryParameters, completion: $0)
        }.call()
    }
    
    /** Begins a trace with the supplied @c AGSUtilityTraceParameters.
    
     This method returns a task that
     supplies a collection of @c AGSUtilityTraceResult objects when the 
     utility network finishes the trace.
    
     If the @c AGSUtilityTraceParameters#traceType in @c AGSUtilityTraceParameters is a subnetwork-based trace, 
     it must have an @c AGSUtilityDomainNetwork set in the @c AGSUtilityTraceConfiguration returned from 
     @c AGSUtilityTraceParameters#traceConfiguration.
     */
    func trace(with traceParameters: AGSUtilityTraceParameters) async throws -> Array<AGSUtilityTraceResult> {
        try await AsyncOperation {
            self.trace(with: traceParameters, completion: $0)
        }.call()
    }
    
}

public extension AGSWFSFeatureTable {
    
    /** Populate the table using a query.
    
     Use the default (empty) QueryParameters to get all features from the service.
     Specifying @c nil or an empty @c NSMutableArray for \p outfields will result in the default set of outfields being used.
     WFS is only compatible with a subset of possible queries defined by QueryParameters. Where clause only works when
     the table is backed by a service powered by GeoServer. Spatial queries (those that specify geometries) must use the Intersects spatial relationship.
     @param parameters Options for controlling the operation.
     @param clearCache If @c YES, clears existing table data before populating with the query result.
     @param outfields An @c NSMutableArray containing @c NSString.
     */
    func populateFromService(with parameters: AGSQueryParameters, clearCache: Bool, outFields: [String]) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.populateFromService(with: parameters, clearCache: clearCache, outFields: outFields, completion: $0)
        }.call()
    }
    
    /** Populate the table using an XML query.
    
     The XML query must be made against the same feature type represented by the WFS feature table.
     The schema of the query result must match or be a subset of the schema of the table.
     @param XMLRequest An XML string representing the complete GetFeature request including but not limited to filters, joins, and aliases.
     @param clearCache If @c YES, clears existing table data before populating with the query result.
     */
    func populateFromService(withRequestXML RequestXML: String, clearCache: Bool) async throws -> AGSFeatureQueryResult {
        try await AsyncOperation {
            self.populateFromService(withRequestXML: RequestXML, clearCache: clearCache, completion: $0)
        }.call()
    }
    
}

public extension AGSWMSSublayer {
    
    /** Fetches the list of legend info.
     */
    func fetchLegendInfos() async throws -> Array<AGSLegendInfo> {
        try await AsyncOperation {
            self.fetchLegendInfos(completion: $0)
        }.call()
    }
    
}


extension Sequence where Element: AGSLoadable {
    /// Load all `AGSLoadables` in a given `Sequence`.
    ///
    /// Swift Concurrency equivalent to [AGSLoadObjects(array:completion:)](https://developers.arcgis.com/ios/api-reference/_a_g_s_loadable_8h.html#a3b0d1007ca7b8805a72fa40510056708).
    ///
    /// - Returns: `true` if all the loadables loaded successfully, otherwise `false`.
    @discardableResult func loadAll() async -> Bool {
        return await withCheckedContinuation { continuation in
            Task {
                AGSLoadObjects(Array(self)) { didAllLoad in
                    continuation.resume(returning: didAllLoad)
                }
            }
        }
    }
}