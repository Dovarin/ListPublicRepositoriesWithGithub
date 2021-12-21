import Foundation

public class GithubApiManager {
    
    var isSigningIn: Bool
    var hasError: Bool = false
    
    init(isSigningIn: Bool) {
        self.isSigningIn = isSigningIn
    }
    
    func signIn() {
        
        var request = URLRequest(url: URL(string: "https://api.github.com/user")!)

        request.httpMethod = "POST"

        let authData = ("username:token").data(using: .utf8)!.base64EncodedString()
        request.addValue(authData, forHTTPHeaderField: "Authorization")

        isSigningIn = true
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if error != nil || (response as! HTTPURLResponse).statusCode != 200 {
                    self?.hasError = true
                    print("Status code: \((response as! HTTPURLResponse).statusCode)")
                } else if let data = data {
                    do {
                        let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)

                        print(signInResponse)

                    } catch {
                        print("Unable to Decode Response \(error)")
                    }
                }
            }
        }.resume()
    }
}

fileprivate struct SignInResponse: Decodable {

    // MARK: - Properties
    let login: String
    let id: Int

}
