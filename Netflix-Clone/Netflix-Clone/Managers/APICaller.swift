//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Muhammed Enes Kılıçlı on 24.02.2023.
//

import Foundation



struct Constants {
    static let API_KEY = "16d8de3ace67028f7cdfd61485dcb1c7"
    static let baseURL = "https://api.themoviedb.org"
}



enum APIError:Error {
    case failedToGetData
}
class APICaller {
    
    
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion:@escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with:URLRequest(url:url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedToGetData))

            }
            
            
        }
        task.resume()
    }
    func getTrendingTvs(completion:@escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with:URLRequest(url:url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            }
            catch {
                completion(.failure(APIError.failedToGetData))
            }
            
            
        }
        task.resume()
    }
    
    func getUpcomingMovies (completion:@escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with:URLRequest(url:url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
  
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            }
            catch {
                print(error.localizedDescription)
            }
            
            
        }
        task.resume()
        
    }
    

    func getPopular (completion:@escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with:URLRequest(url:url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
  
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            }
            catch {
                completion(.failure(APIError.failedToGetData))

            }
            
            
        }
        task.resume()
    }
    func getTopRated (completion:@escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with:URLRequest(url:url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
  
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            }
            catch {
                completion(.failure(APIError.failedToGetData))
            }
            
            
        }
        task.resume()
    }
        
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))

                } catch {
                    completion(.failure(APIError.failedToGetData))
                }

            }
            task.resume()
        }
        
    
    func search (with query : String,completion: @escaping (Result<[Title], Error>) -> Void) {
      
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key7=\(Constants.API_KEY){api_key}&query=\(query)") else {return
             
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
    })
    
    
    
}

