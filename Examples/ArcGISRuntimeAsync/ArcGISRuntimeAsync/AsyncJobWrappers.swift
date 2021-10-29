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

import ArcGIS

extension AGSJob {
    enum OperationError: Error {
        case nilResultNilError
    }
}

public extension AGSExportTileCacheJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSTileCache {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSGenerateOfflineMapJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSGenerateOfflineMapResult {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSOfflineMapSyncJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSOfflineMapSyncResult {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSSyncGeodatabaseJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> [AGSSyncLayerResult] {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSGeoprocessingJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSGeoprocessingResult {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSGenerateGeodatabaseJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSGeodatabase {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSExportVectorTilesJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSExportVectorTilesResult {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

public extension AGSEstimateTileCacheSizeJob {
    func start(statusHandler: ((AGSJobStatus) -> Void)?) async throws -> AGSEstimateTileCacheSizeResult {
        guard self.status == .notStarted else {
            fatalError("It is a programming error to start a running job.")
        }

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
                        continuation.resume(returning: result)
                    } else {
                        continuation.resume(throwing: OperationError.nilResultNilError)
                    }
                }
            }
        })

    }
}

