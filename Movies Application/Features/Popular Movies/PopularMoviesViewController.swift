//
//  Copyright © Modus Create. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PopularMoviesViewController: UICollectionViewController {
	
	var summary: [MovieSummary]?
	
	init() {
		let layout = UICollectionViewFlowLayout()
		super.init(collectionViewLayout: layout)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Popular"
		
		getPopularMovies()
	}
	
	func getPopularMovies() {
		Task {
				do {
					let movies = try await MoviesClient(apiKey: Constants.apiKey).popularMovies()
					summary = movies
				} catch {
						print("Request failed with error: \(error)")
				}
		}
	}
	
	@available(*, unavailable)
	required init?(coder _: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
