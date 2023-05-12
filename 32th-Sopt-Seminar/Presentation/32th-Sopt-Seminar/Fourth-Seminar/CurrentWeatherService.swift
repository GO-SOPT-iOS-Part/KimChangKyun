//
//  CurrentWeatherService.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/12.
//

import Foundation

import Alamofire

final class CurrentWeatherService {
    
    static let get = CurrentWeatherService()
    
    private init() {}
    
    func loadWeather(city: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.weatherURL + "q=\(city)" + "&appid=" + Config.weatherAPI
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200:
            return isValidData(data: data)
        case 400, 409:
            return isValidData(data: data)
        case 500:
            return .serverErr
        default:
            return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Weathers.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
