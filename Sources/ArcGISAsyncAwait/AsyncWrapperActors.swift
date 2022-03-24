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

/// An actor that is useful for wrapping an "asynchronous operation" and allowing it to be called
/// with Swift's `async` keyword. The asynchronous operation is expected to take a completion
/// handler and return a cancelable, and may throw an error.
public actor AsyncOperation<Success, Failure> {
    
    /// An error that can occur within the async operation.
    enum OperationError: Error {
        case nilResultNilError
    }
    
    /// The cancelable returned by the operation provider.
    private var cancelable: AGSCancelable?
    
    /// The operation provider.
    private let operationProvider: (@escaping (Success?, Failure?) -> Void) -> AGSCancelable?
    
    /// Initializes an AsyncOperation with an operation provider.
    /// - Parameter operationProvider: An operation provider which is a closure that takes a
    /// completion handler and returns a cancellable. The completion handler must be called when
    /// the operation is completed. This is usually conveniently done by forwarding it to the
    /// operation.
    /// An example would be:
    /// ```
    ///  AsyncOperation { self.suggest(withSearchText: text, completion: $0) }
    ///  ```
    init(_ operationProvider: @escaping (@escaping (Success?, Failure?) -> Void) -> AGSCancelable) {
        self.operationProvider = operationProvider
    }

    /// Initializes an AsyncOperation with an operation provider.
    /// - Parameter operationProvider: An operation provider which is a closure that takes a
    /// completion handler and returns an optional cancellable. The completion handler must be called when
    /// the operation is completed. This is usually conveniently done by forwarding it to the
    /// operation.
    /// An example would be:
    /// ```
    ///  AsyncOperation { self.suggest(withSearchText: text, completion: $0) }
    ///  ```
    init(_ operationProvider: @escaping (@escaping (Success?, Failure?) -> Void) -> AGSCancelable?) {
        self.operationProvider = operationProvider
    }

    /// Cancels the wrapped operation.
    private func cancel() {
        self.cancelable?.cancel()
        self.cancelable = nil
    }
    
    /// Calls the operation as an async throwing function.
    /// - Returns: A value representing the successful result of the operation.
    func call() async throws -> Success {
        precondition(self.cancelable == nil, "It is a programming error to call `call()` more than one time per instance.")

        return try await withTaskCancellationHandler(handler: {
            Task { await cancel() }
        }, operation: {
            try Task.checkCancellation()
            return try await withUnsafeThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                    continuation.resume(throwing: CancellationError())
                    return
                }
                Task {
                    cancelable = operationProvider { result, error in
                        if let error = error as? Error {
                            continuation.resume(throwing: error)
                        } else if let result = result {
                            continuation.resume(returning: result)
                        } else {
                            continuation.resume(throwing: OperationError.nilResultNilError)
                        }
                    }
                }
            }
        })
    }
}

/// An actor that is useful for wrapping an "asynchronous operation" and allowing it to be called
/// with Swift's `async` keyword. The asynchronous operation is expected to take a completion
/// handler and return a cancelable, but cannot throw an error.
public actor AsyncOperationErrorOnly<Failure> {
    
    /// The cancelable returned by the operation provider.
    private var cancelable: AGSCancelable?
    
    /// The operation provider.
    private let operationProvider: (@escaping (Failure?) -> Void) -> AGSCancelable?
    
    /// Initializes an AsyncOperation with an operation provider.
    /// - Parameter operationProvider: An operation provider which is a closure that takes a
    /// completion handler and returns a cancellable. The completion handler must be called when
    /// the operation is completed. This is usually conveniently done by forwarding it to the
    /// operation.
    /// An example would be:
    /// ```
    ///  AsyncOperation { self.suggest(withSearchText: text, completion: $0) }
    ///  ```
    init(_ operationProvider: @escaping (@escaping (Failure) -> Void) -> AGSCancelable) {
        self.operationProvider = operationProvider
    }
    
    /// Cancels the wrapped operation.
    private func cancel() {
        self.cancelable?.cancel()
        self.cancelable = nil
    }

    /// Calls the operation as an async throwing function.
    /// - Returns: A value representing the successful result of the operation.
    func call() async throws {
        precondition(self.cancelable == nil, "It is a programming error to call `call()` more than one time per instance.")

        return try await withTaskCancellationHandler(handler: {
            Task { await cancel() }
        }, operation: {
            try Task.checkCancellation()
            return try await withUnsafeThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                    continuation.resume(throwing: CancellationError())
                    return
                }
                Task {
                    cancelable = operationProvider { error in
                        if let error = error as? Error {
                            continuation.resume(throwing: error)
                        } else {
                            continuation.resume()
                        }
                    }
                }
            }
        })
    }

}

/// An actor that is useful for wrapping an "asynchronous operation" and allowing it to be called
/// with Swift's `async` keyword. The asynchronous operation is expected to take a completion
/// handler and return a cancelable, but cannot throw an error.
public actor AsyncOperationNoThrow<Success> {
    
    /// The cancelable returned by the operation provider.
    private var cancelable: AGSCancelable?
    
    /// The operation provider.
    private let operationProvider: (@escaping (Success) -> Void) -> AGSCancelable
    
    /// Initializes an AsyncOperation with an operation provider.
    /// - Parameter operationProvider: An operation provider which is a closure that takes a
    /// completion handler and returns a cancellable. The completion handler must be called when
    /// the operation is completed. This is usually conveniently done by forwarding it to the
    /// operation.
    /// An example would be:
    /// ```
    ///  AsyncOperation { self.suggest(withSearchText: text, completion: $0) }
    ///  ```
    init(_ operationProvider: @escaping (@escaping (Success) -> Void) -> AGSCancelable) {
        self.operationProvider = operationProvider
    }
    
    /// Cancels the wrapped operation.
    private func cancel() {
        self.cancelable?.cancel()
        self.cancelable = nil
    }
    
    /// Calls the operation as an async throwing function.
    /// - Returns: A value representing the successful result of the operation.
    func call() async -> Success {
        precondition(self.cancelable == nil, "It is a programming error to call `call()` more than one time per instance.")

        return try! await withTaskCancellationHandler(handler: {
            Task { await cancel() }
        }, operation: {
            try Task.checkCancellation()
            return await withUnsafeContinuation { continuation in
                guard !Task.isCancelled else {
                    return
                }
                Task {
                    cancelable = operationProvider { result in
                        continuation.resume(returning: result)
                    }
                }
            }
        })
    }
}

/// An actor that is useful for wrapping an "asynchronous operation" and allowing it to be called
/// with Swift's `async` keyword. The asynchronous operation is expected to take a completion
/// handler accepting 3 success values or an error, and returns a cancelable.
actor AsyncOperationThreeSuccesses<Success, Failure> {
    
    /// An error that can occur within the async operation.
    enum OperationError: Error {
        case nilResultNilError
    }
    
    /// The cancelable returned by the operation provider.
    private var cancelable: AGSCancelable?
    
    /// The operation provider.
    private let operationProvider: (@escaping (Success?, Success?, Success?, Failure?) -> Void) -> AGSCancelable
    
    /// Initializes an AsyncOperation with an operation provider.
    /// - Parameter operationProvider: An operation provider which is a closure that takes a
    /// completion handler and returns a cancellable. The completion handler must be called when
    /// the operation is completed. This is usually conveniently done by forwarding it to the
    /// operation.
    /// An example would be:
    /// ```
    ///  AsyncOperation { self.suggest(withSearchText: text, completion: $0) }
    ///  ```
    init(_ operationProvider: @escaping (@escaping (Success?, Success?, Success?, Failure?) -> Void) -> AGSCancelable) {
        self.operationProvider = operationProvider
    }
    
    /// Cancels the wrapped operation.
    private func cancel() {
        self.cancelable?.cancel()
        self.cancelable = nil
    }
    
    /// Calls the operation as an async throwing function.
    /// - Returns: A value representing the successful result of the operation.
    func call() async throws -> (Success?, Success?, Success?) {
        precondition(self.cancelable == nil, "It is a programming error to call `call()` more than one time per instance.")

        return try await withTaskCancellationHandler(handler: {
            Task { await cancel() }
        }, operation: {
            try Task.checkCancellation()
            return try await withUnsafeThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                    continuation.resume(throwing: CancellationError())
                    return
                }
                Task {
                    cancelable = operationProvider { result1, result2, result3, error in
                        if let error = error as? Error {
                            continuation.resume(throwing: error)
                        } else {
                            if result1 != nil || result2 != nil || result3 != nil {
                                continuation.resume(returning: (result1, result2, result3))
                            } else {
                                continuation.resume(throwing: OperationError.nilResultNilError)
                            }
                        }
                    }
                }
            }
        })
    }
}