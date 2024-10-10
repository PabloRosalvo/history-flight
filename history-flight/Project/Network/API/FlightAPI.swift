import Foundation

struct FlightAPI {
    private let requestManagerProtocol: RequestManagerProtocol
    enum BaseUrl {
        static let url = "https://www.wayairlines.com/flights"
    }
    init(_ requestManagerProtocol: RequestManagerProtocol = RequestManager()) {
        self.requestManagerProtocol = requestManagerProtocol
    }
    func fetchList(completion: @escaping (FlightsResponse?, RequestError?) -> Void) {
        guard let url = URL(string: BaseUrl.url) else {
            return
        }
        self.requestManagerProtocol.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<FlightsResponse>) in
            switch result {
            case .success(let model):
                completion(model, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
