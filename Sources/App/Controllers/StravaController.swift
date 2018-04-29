import Foundation
import Vapor

class StravaController {
    
    func subscribe(request: Request) -> ResponseRepresentable {
        
        guard let query = request.query?.object,
            let challenge = query["hub.challenge"]?.wrapped else {
                print("no challenge found")
                return "no challenge found"
        }
        
        let json = JSON(["hub.challenge": challenge])
        
        return try! Response(status: .ok , json: json)
    }
    
    func forwardActivity(request: Request) -> ResponseRepresentable {
        
        print(request)
        
        return try! Response(status: .ok , json: JSON() )

/*
        {
            "subscription_id": "1",
            "owner_id": 321321,
            "object_id": 12312312312,
            "object_type": "activity",
            "aspect_type": "create",
            "event_time": 1297286541
        }
*/
        
    }
}
