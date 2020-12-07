//
//  Post.swift
//  JSONDApiApp
//
//  Created by Ilja Patrushev on 7.12.2020.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
