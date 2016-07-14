//
//  UploadHandler.swift
//  Upload Enumerator
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
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

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

// Create HTTP server
let server = HTTPServer()

let handler = {
	(request: HTTPRequest, response: HTTPResponse) in
	
	let webRoot = request.documentRoot
	mustacheRequest(request: request, response: response, handler: UploadHandler(), templatePath: webRoot + "/index.mustache")
}

// Add our routes
var routes = Routes()
routes.add(method: .get, uri: "/", handler: handler)
routes.add(method: .post, uri: "/", handler: handler)

server.addRoutes(routes)

// Set the listen port
server.serverPort = 8181

// Set the server's webroot
server.documentRoot = "./webroot"

do {
    // Launch the server
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
