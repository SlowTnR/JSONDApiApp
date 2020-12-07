//
//  ViewController.swift
//  JSONDApiApp
//
//  Created by Ilja Patrushev on 7.12.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPostData { (posts) in
            for post in posts {
                print(post.title)
            }
        }
        
    }

    func fetchPostData(completionHandler: @escaping([Post]) -> Void){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Cant get posts from url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let postsData = try JSONDecoder().decode([Post].self, from: data)
                
                completionHandler(postsData)
            }
            
            catch {
                let error = error
                print(error.localizedDescription)
            }
            
            
        }.resume()
    }
}

