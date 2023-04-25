//
//  JokeManager.swift
//  JokesApp
//
//  Created by Anil Duran on 24.04.2023.
//

import Foundation

protocol JokeManagerDelegate {
    func didUpdateJoke(joke: Joke)
}

struct JokeManager {
    
    var delegate: JokeManagerDelegate?

    func performRequest() {
        
        if let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=twopart") {
            
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data {
                    
                    do {
                        
                        let decoder = JSONDecoder()
                        let joke = try decoder.decode(Joke.self, from: data)
                        self.delegate?.didUpdateJoke(joke: joke)

                    } catch {
                        print(error)
                    }
  
                }
  
            }
            
            dataTask.resume()
            
        }
    }
    
}


