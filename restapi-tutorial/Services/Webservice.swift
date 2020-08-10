
import Foundation

class Webservice {
    
    func getPosts(completion: @escaping ([Post]?) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("invalid URL")
        }
        
        URLSession.shared.dataTask(with: url){
            data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }.resume()
    }
}
