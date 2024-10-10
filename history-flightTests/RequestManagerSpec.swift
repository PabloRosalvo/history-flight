import Quick
import Nimble
@testable import history_flight

final class RequestManagerSpec: QuickSpec {
    override class func spec() {
        describe("RequestManager") {
            var requestManager: RequestManager!
            let url = URL(string: "https://api.mock.com/data")!
            var mockSession: MockURLSession!
            
            beforeEach {
                mockSession = MockURLSession()
                requestManager = RequestManager(session: mockSession)
            }
            
            it("should return success when the request is successful") {
                guard let mockData = Bundle.main.loadJsonData(fileName: "flights") else {
                    fail("Erro ao carregar dados mock")
                    return
                }

                mockSession.nextData = mockData
                mockSession.nextResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
                
                waitUntil(timeout: .seconds(3)) { done in
                    requestManager.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<FlightsResponse>) in
                        switch result {
                        case .success(let data):
                            expect(data).toNot(beNil())
                            expect(data.flights.count).to(equal(20)) // Validação do retorno
                        case .failure:
                            fail("Request deveria ter sido bem-sucedida")
                        }
                        done()
                    }
                }
            }
            
            it("should return failure when the request fails") {
                mockSession.nextResponse = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
                
                waitUntil(timeout: .seconds(3)) { done in
                    requestManager.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<FlightsResponse>) in
                        switch result {
                        case .success:
                            fail("Request deveria ter falhado")
                        case .failure(let error):
                            expect(error.statusCode).to(equal(HTTPStatusCode(rawValue: 400) ?? HTTPStatusCode(rawValue: 0)))
                        }
                        done()
                    }
                }
            }
        }
    }
}

class MockURLSession: URLSession {
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.nextData, self.nextResponse, self.nextError)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
