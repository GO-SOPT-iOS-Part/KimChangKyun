//
//  Config.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/06.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let weatherURL = "WEATHER_URL"
            static let weatherAPI = "WEATHER_API"
            static let tmdbURL = "TMDB_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        
        return key
    }()
    
    static let weatherURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.weatherURL] as? String else {
            fatalError("Weather URL is not set in plist for this configuration.")
        }
        
        return key
    }()
    
    static let weatherAPI: String = {
        guard let key = Config.infoDictionary[Keys.Plist.weatherAPI] as? String else {
            fatalError("Weather API is not set in plist for this configuration.")
        }
        
        return key
    }()
    
    static let tmdbURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.tmdbURL] as? String else {
            fatalError("TMDB URL is not set in plist for this configuration.")
        }
        
        return key
    }()
}
