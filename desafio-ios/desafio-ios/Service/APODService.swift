//
//  APODService.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import Foundation
import Alamofire

class APODService {
    
    let url = "https://api.nasa.gov/planetary/apod?api_key=Qnai9ZImoOHXcmjWootncGoGyojLyl9ZbGgzmCAt&date="
    var date = Date()
    let dateFormater = DateFormatter()
    let rangeOfDays = -30
    
    func getRangeDate() -> [String]? {
        dateFormater.dateFormat = "YYYY-MM-dd"
        guard let previous10days = Calendar.current.date(byAdding: .day, value: rangeOfDays, to: date) else { return nil }
        let dates = [dateFormater.string(from: date), dateFormater.string(from: previous10days)]
        self.date = previous10days
        return dates
    }
    
    func getURL() -> String? {
        guard let dates = getRangeDate() else { return nil }
        let url = "\(self.url)&end_date=\(dates[0])&start_date=\(dates[1])"
        return url
    }
    
    func request(completion: @escaping([APOD]?) -> Void) {
        if let url = getURL() {
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let result):
                    let apods = try! JSONDecoder().decode([APOD].self, from: result)
                    completion(apods)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }
    }
}
