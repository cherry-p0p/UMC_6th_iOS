import Alamofire
import UIKit

class RequestFile{
    func getRequestData(_ viewController: ViewController){
        let url = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=100&serviceKey=KEvp29j80DheWhfELl%2FF5vMD1JOgs%2FsnWm%2FCzfL4x6sOcMoXwxzQyS3G5tLak2O6q2pLsyrKCyujKmsqsRw%2FBA%3D%3D" //발급받은 키 추가
        let params: Parameters = [
            "page" : 1,
            "perPage" : 100,
            "serviceKey" : "KEvp29j80DheWhfELl%2FF5vMD1JOgs%2FsnWm%2FCzfL4x6sOcMoXwxzQyS3G5tLak2O6q2pLsyrKCyujKmsqsRw%2FBA%3D%3D"//발급받은 키
        ]
        
        //HTTP Method GET
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
        .responseDecodable(of: ResponseFile.self) {response in
            
            switch response.result{
            case .success(let response):
                print("DEBUG>> OpenWeather Response \(response)")
                viewController.didSuccess(response)
                
            case .failure(let error):
                print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
            }
        }
    }
}
