//
//  Joke.swift
//  JokesApp
//
//  Created by Anil Duran on 24.04.2023.
//

import Foundation


struct Joke: Decodable {
    let category: String
    let type: String
    let setup: String
    let delivery: String
    let safe: Bool
    let id: Int
    let lang: String
}
