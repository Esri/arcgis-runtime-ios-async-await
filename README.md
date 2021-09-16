ArcGIS Runtime SDK for iOS async/await wrappers
==========================

This repository provides async wrappers for [ArcGIS Runtime SDK for iOS](https://developers.arcgis.com/ios/) asynchronous methods, for use with the async/await capabilities introduced in Swift 5.5.

Xcode will automatically generate async wrappers for most asynchronous methods, but if that method returns a value, then it must be wrapped explicitly with an async wrapper. For the ArcGIS Runtime SDK for iOS, this generally means that the loadable pattern is automatically wrapped, but most asynchronous methods in the Runtime SDK return an `AGSCancelable`, and so require custom wrapper methods to be defined.

## Features

* A comprehensive set of `async` wrappers for the asynchronous methods provided in the 100.12 release of the ArcGIS Runtime SDK for iOS.
* Helper actors to support these wrappers.

If you find any methods that are missing an async wrapper, please open an issue or, better yet, please submit a PR adding the method.

## Requirements

* [ArcGIS Runtime SDK for iOS](https://developers.arcgis.com/ios/) 100.12.0 (or newer)
* Xcode 13.0 (or newer)
* iOS 15 (or newer)

## Instructions

### Swift Package Manager

 1. Open your project in Xcode
 2. Go to *File* > *Swift Packages* > *Add Package Dependency* option 
 3. Enter `https://github.com/Esri/arcgis-runtime-ios-async-await` as the package repository URL
 4. Choose version 100.12.0 or a later version. Click Next.
 
 Note: The ArcGIS Runtime Async Await Swift Package adds the ArcGIS SDK Swift Package as a dependency so no need to add both separately. If you already have the ArcGIS Runtime SDK Swift Package, delete that and just add the ArcGIS Runtime SDK Async Await Swift Package. 

 New to Swift Package Manager? Visit [swift.org/package-manager/](https://swift.org/package-manager/).

### Manual

 1. Clone or download this repo
 2. Drag and drop the `AsyncWrappers.swift` and `AsyncWrapperActors.swift` files into your project through the Xcode Project Navigator pane

## Additional Resources

* Want to start a new Runtime project? [Setup](https://developers.arcgis.com/ios/get-started) your dev environment
* New to the API? Explore the documentation : [Guide](https://developers.arcgis.com/ios/) | [API Reference](https://developers.arcgis.com/ios/api-reference/)
* Got a question? Ask the community on our [forum](https://community.esri.com/community/developers/native-app-developers/arcgis-runtime-sdk-for-ios/)

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

A copy of the license is available in the repository's [LICENSE](https://github.com/Esri/arcgis-runtime-ios-async-await/blob/main/LICENSE) file.
