//
//  OpenAIService.swift
//  AICaptions
//
//  Created by ashima arora on 4/10/25.
//

import Foundation
import PhotosUI

class OpenAIService {
    private let apiKey = "" /// CHANGE THIS!!!!!!!
    private let apiURL = URL(string: "https://api.openai.com/v1/chat/completions")! //
    
    func getRequestBodyForTextCaptions(from prompt: String) -> [String: Any]?{
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "system", "content": "You are a helpful assistant that writes social media captions based on prompts or image descriptions."],
                ["role": "user", "content": "Generate 3 short, trendy Instagram captions for: \(prompt)"]
            ],
            "temperature": 0.8
        ]
        return body
    }
    
    func getRequestBodyForImageCaptions(from image: UIImage)->[String:Any]?{
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return nil }
        let base64String = imageData.base64EncodedString()
        let base64Prefix = "data:image/jpeg;base64,"
        let fullBase64 = base64Prefix + base64String
        
        let body: [String: Any] = [
            "model": "gpt-4-vision-preview",
            "messages": [
                [
                    "role": "user",
                    "content": [
                        ["type": "text", "text": "Generate 3 short, stylish Instagram captions for this image."],
                        ["type": "image_url", "image_url": ["url": fullBase64]]
                    ]
                ]
            ],
            "max_tokens": 300
        ]
        
        return body
    }
    
    func getRequestInfo() -> URLRequest{
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
        
    }
    
    //takes string and returns list of Caption strings
    func generateCaptionsFromText(from prompt: String, completion: @escaping  ([String]) -> Void) {
        var request = getRequestInfo()
        //payload - Swift dictionary
        guard let body = getRequestBodyForTextCaptions(from: prompt),
              let jsonData = try?JSONSerialization.data(withJSONObject: body) else {
            print("Failed to serialize request body")
            completion([])
            return
        }
        
        request.httpBody = jsonData
        //Send the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error:", error ?? "Unknown error")
                completion([])
                return
            }
            
            do {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON Response:\n\(jsonString)")
                }
                
                //Decode the response
                let decoded = try JSONDecoder().decode(OpenAIResponse.self, from: data)
                let captions = decoded.choices.map { $0.message.content.trimmingCharacters(in: .whitespacesAndNewlines) }
                completion(captions)
            } catch {
                print("Failed to decode response:", error)
                print(String(data: data, encoding: .utf8) ?? "Invalid JSON")
                completion([])
            }
        }.resume()
    }
    
    func generateCaptionsFromImage(from image: UIImage, completion: @escaping (String) -> Void){
        // 1. Create the request body
        guard let body = getRequestBodyForImageCaptions(from: image),
              let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Failed to build JSON body")
            completion("")
            return
        }
        
        var request =  getRequestInfo()
        request.httpBody = jsonData
        //Send request
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error:", error ?? "Unknown error")
                completion("")
                return
            }
            
            //parse response
            do{
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let choices = json["choices"] as? [[String: Any]],
                   let message = choices.first?["message"] as? [String: Any],
                   let content = message["content"] as? String {
                    completion(content)
                } else {
                    print("Invalid response format")
                    completion("")
                }
            } catch{
                print("JSON parsing error: \(error.localizedDescription)")
                completion("")
            }
        }.resume()
    }
}

    // MARK: - Response Structs

    struct OpenAIResponse: Codable {
        let choices: [Choice]
    }

    struct Choice: Codable {
        let message: Message
    }

    struct Message: Codable {
        let content: String
    }


