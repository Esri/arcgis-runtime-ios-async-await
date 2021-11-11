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

// //////////////////////////////////////////////////////////////////////////////////////////
// IMPORTANT USAGE NOTE:
//
// To use these AGSJob subclass extensions, manually copy this Swift file into your project.
// Otherwise Xcode will not prefer these method definitions to the automatically bridged
// definitions created from the Objective-C SDK.
// //////////////////////////////////////////////////////////////////////////////////////////

import Foundation
import ArcGIS

extension AGSJob {
    enum OperationError: Error {
        case nilResultNilError
    }

    fileprivate func _start<T>(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> T {
        precondition(status == .notStarted, "It is a programming error to call start() on an already running job.")

        return try await withTaskCancellationHandler(handler: {
            self.progress.cancel()
        }, operation: {
            try Task.checkCancellation()
            return try await withUnsafeThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                    continuation.resume(throwing: CancellationError())
                    return
                }
                
                self.start(statusHandler: statusHandler) { result, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let result = result {
                        guard let result = result as? T else {
                            fatalError("The generic AGSJob _start() method has been incorrectly wrapped by the AGSJob subclass.")
                            // Check the return type of the AGSJob subclass's wrapper against the result that subclass actually generates.
                        }
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })
    }
}

public extension AGSDownloadPreplannedOfflineMapJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSDownloadPreplannedOfflineMapResult {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSEstimateTileCacheSizeJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSEstimateTileCacheSizeResult {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSExportTileCacheJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSTileCache {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSExportVectorTilesJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSExportVectorTilesResult {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSGenerateGeodatabaseJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSGeodatabase {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSGenerateOfflineMapJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSGenerateOfflineMapResult {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSGeoprocessingJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSGeoprocessingResult {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSOfflineMapSyncJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSOfflineMapSyncResult {
        return try await _start(statusHandler: statusHandler)
    }
}

public extension AGSSyncGeodatabaseJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> [AGSSyncLayerResult] {
        return try await _start(statusHandler: statusHandler)
    }
}
