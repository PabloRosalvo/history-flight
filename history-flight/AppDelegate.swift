import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var homeCoordinator: HomeCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initApplication()
        return true
    }

    func initApplication() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator?.start()

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
