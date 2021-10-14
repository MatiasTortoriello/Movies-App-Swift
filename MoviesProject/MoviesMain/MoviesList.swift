//
//  MoviesList.swift
//  MoviesProject
//
//  Created by Infinixsoft on 12/10/2021.
//

import UIKit
import Alamofire

class MoviesList: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBOutlet weak var moviesTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var logOutButton: UIButton!
    var topMovieList = [Movie]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTable.delegate = self
        moviesTable.dataSource = self
        searchBar.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        loadMovies()
    }
    
    
    func loadMovies(){
        let movieRequest = AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=c173dc160230df8a6d5a562c21e874d7", method: HTTPMethod.get)
        
        movieRequest.responseData { response in
            guard let data = response.data else {
                return
            }
            
            let decoder = JSONDecoder()
            let topRatedMovies = try! decoder.decode(MovieJSON.self, from: data)
            
            self.topMovieList = topRatedMovies.results
            self.moviesTable.reloadData()
        }
    }
    
    
    /******************
        SEARCH
     *********************/
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        movieSearch()
        return true
    }
    
    func movieSearch() {
        searchBar.resignFirstResponder()
        
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        
       
    }
    
    //BACK BUTTON
    @IBAction func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }


}

class MovieJSON: Codable{
    let page: Int
    let results: [Movie]
}

class Movie: Codable{
    
    let id: Int
    let poster_path: String
    let title: String
    let original_title: String
    let original_language: String
    let release_date: String
    let overview: String
    let popularity: Double
    let vote_average: Double
    let vote_count: Int
    
    }
    
struct MovieResults: Codable {
    let Search:[Movie]
}


