// swift-tools-version:4.0
//
//  Package.swift
//  PerfectExample-UploadEnumerator
//
//  Created by Kyle Jessup on 3/22/16.
//	Copyright (C) 2016 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

let package = Package(
	name: "UploadEnumerator",
    products: [
        .executable(name: "UploadEnumerator", targets: ["UploadEnumerator"])
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", from: "3.0.0")
    ],
	targets: [
        .target(name: "UploadEnumerator", dependencies: ["PerfectHTTPServer", "PerfectMustache"], path: "Sources")
	]
)
