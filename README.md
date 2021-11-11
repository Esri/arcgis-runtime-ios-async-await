ArcGIS Runtime SDK for iOS async/await wrappers
==========================

This repository provides async/await wrappers for [ArcGIS Runtime SDK for iOS](https://developers.arcgis.com/ios/) asynchronous methods using the Swift Concurrency capabilities introduced in Swift 5.5.

Xcode will automatically generate async/await wrappers for most asynchronous methods, but if the original method returns a value, then it must be wrapped explicitly to handle that return value. Many asynchronous methods in the ArcGIS Runtime SDK for iOS return an [`AGSCancelable`](https://developers.arcgis.com/ios/api-reference/protocol_a_g_s_cancelable-p.html), and so are not automatically wrapped by Xcode. This repository provides those missing wrappers.

## Features

* A comprehensive set of `async` wrappers for ArcGIS Runtime SDK for iOS version 100.12 to complement those generated automatically by Xcode.
* Helper actors to support these wrappers.
* A demo app showing Swift Concurrency patterns in use with the ArcGIS Runtime SDK for iOS.

If you find any methods that are missing an async wrapper, please open an issue (or better yet, submit a PR adding the method).

## Requirements

* [ArcGIS Runtime SDK for iOS](https://developers.arcgis.com/ios/) 100.12.0 (or newer)
* Xcode 13.0 (or newer)
* iOS 15 (or newer)

## Instructions

1. Reference the source. Either use Swift Package Manager, or include the `AsyncWrappers.swift` and `AsyncWrapperActors.swift` source files in your project (see below).
2. If you're using the Swift Package Manager, add an `import ArcGISAsyncAwait` statement to your Swift source files.
3. Optional: If you are executing `AGSJobs`, manually copy the `AsyncCancelableJobWrapper.swift` file into your project. See [Known Issues](#known-issues) for more details.

### Swift Package Manager

 1. Open your project in Xcode.
 2. Go to **File** > **Add Packages…**.
 3. Enter `https://github.com/Esri/arcgis-runtime-ios-async-await` as the Package URL.
 4. Set the `Dependency Rule` to **Branch** and reference the `main` branch. Click **Add Package**.
 
 Note: The ArcGIS Runtime Async Await Swift Package adds the ArcGIS Runtime SDK package as a dependency.

 New to Swift Package Manager? Visit [swift.org/package-manager/](https://swift.org/package-manager/).

### Manual

 1. Clone or download this repo.
 2. Drag and drop the `AsyncWrappers.swift` and `AsyncWrapperActors.swift` files into your project through the Xcode Project Navigator pane.

## Known Issues
* To use the cancelable `AGSJob` subclass extensions, you must manually copy the `AsyncCancelableJobWrappers.swift` file into your project. Otherwise, the compiler will prefer the non-canceling async wrappers that Xcode automatically generates from the Objective-C methods.
* This release has only been tested with Xcode 13 and iOS 15. Xcode 13.2 will open up Swift Concurrency backwards compatibility for iOS 13 and iOS 14. This hasn't been tested yet.

## Additional Resources

* Want to start a new Runtime project? [Setup](https://developers.arcgis.com/ios/get-started) your dev environment.
* New to the API? Explore the documentation : [Guide](https://developers.arcgis.com/ios/) | [API Reference](https://developers.arcgis.com/ios/api-reference/).
* Got a question? Ask the community on our [forum](https://community.esri.com/t5/arcgis-runtime-sdk-for-ios-questions/bd-p/arcgis-runtime-sdk-for-ios-questions).

## Issues

Find a bug or want to request a new feature? Please let us know by submitting an issue.

## Contributing

Esri welcomes contributions from anyone and everyone. Please see our [guidelines for contributing](https://github.com/esri/contributing).

## Licensing

Copyright 2021 Esri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

A copy of the license is available in the repository's [LICENSE](LICENSE) file.
