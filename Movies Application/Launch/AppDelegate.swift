//
//  Copyright © Modus Create. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {
	var window: UIWindow?
	
	// swiftlint:disable:next discouraged_optional_collection
	func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		let rootViewController = PopularMoviesViewController()
				let navigationController = UINavigationController(rootViewController: rootViewController)
				self.window = UIWindow(frame: UIScreen.main.bounds)
				self.window?.rootViewController = navigationController
				self.window?.makeKeyAndVisible()

		return true
	}
}
