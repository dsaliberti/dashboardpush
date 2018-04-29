import Vapor

extension Droplet {
    func setupRoutes() throws {
        let notificationController = NotificationController()
        let stravaController = StravaController()
        let trendController = TrendController()
        
        // Receives a Strava Event from webhook
        get("strava", handler: stravaController.subscribe)
        
        // Receives pushes `post`s from Strava API
        post("strava", handler: stravaController.forwardActivity)
        
        // Route for checking trends
        post("trends", handler: trendController.checkTrend)
        
        // Route for storing mobile device token
        post("registerDevice", handler: notificationController.registerDevice)
    }
}
