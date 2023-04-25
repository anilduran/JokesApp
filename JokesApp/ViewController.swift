//
//  ViewController.swift
//  JokesApp
//
//  Created by Anil Duran on 24.04.2023.
//

import UIKit

class ViewController: UIViewController, JokeManagerDelegate {
    
    

    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!

    var jokeManager = JokeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeManager.delegate = self
        jokeManager.performRequest()
        
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        jokeManager.performRequest()
    }
    
    func didUpdateJoke(joke: Joke) {
        DispatchQueue.main.async {
            self.setupLabel.text = joke.setup
            self.deliveryLabel.text = joke.delivery
        }
    }


}

