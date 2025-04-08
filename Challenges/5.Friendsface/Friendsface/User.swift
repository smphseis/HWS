//
//  User.swift
//  Friendsface
//
//  Created by Phil Seißelberg on 01.10.24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

extension User {
    static var decodedSampleUserDate: Date {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try! JSONDecoder().decode(Date.self, from: "2015-11-10T01:47:18-00:00".data(using: .utf8)!)
    }
    
    static let sampleUser = User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: decodedSampleUserDate, tags: ["cillum","consequat","deserunt","nostrud","eiusmod","minim","tempor"], friends: [
            Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"), Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton"), Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson"), Friend(id: "f2f86852-8f2d-46d3-9de5-5bed1af9e4d6", name: "Hess Ford"), Friend(id: "6ba32d1b-38d7-4b0f-ba33-1275345eacc0", name: "Bonita White")])
    
}
