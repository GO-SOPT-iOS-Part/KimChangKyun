//
//  ViewController_WeatherAPI.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/12.
//

import UIKit

class ViewController_WeatherAPI: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        loadWeather()
    }

    private func loadWeather() {
        
        CurrentWeatherService.get.loadWeather(city: "seoul") { response in
            switch response {
            case .success(let data):
                guard let data = data as? Weathers else { return }
                dump(data)
            default:
                print("tlqkftlqkf")
                return
            }
        }
    }
}
