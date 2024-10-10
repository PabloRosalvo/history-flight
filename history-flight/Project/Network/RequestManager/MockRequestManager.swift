import Foundation

struct MockRequestManager: RequestManagerProtocol {
    let mockData: Data
    func request<T: Decodable>(url: URL, method: HTTPMethodV2, parameters: ParametersV2?, headers: HTTPHeadersV2?, completion: @escaping (Result<T>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601 // ou outra estratégia conforme necessário

            do {
                let decodedData = try decoder.decode(T.self, from: self.mockData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(RequestError(reason: "Failed to decode mock data", statusCode: 500, data: self.mockData)))
            }
        }
    }
}
