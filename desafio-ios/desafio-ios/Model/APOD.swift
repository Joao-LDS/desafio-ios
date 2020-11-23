//
//  APOD.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import Foundation

struct APOD: Codable {
    var copyright: String?
    var date: String
    var explanation: String
    var hdurl: URL?
    var media_type: String
    var service_version: String
    var title: String
    var url: URL
}
