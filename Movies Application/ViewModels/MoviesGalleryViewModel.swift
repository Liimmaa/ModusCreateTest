//
//  Copyright © Modus Create. All rights reserved.
//

import SwiftUI

class MoviesGalleryViewModel: ObservableObject {
	@Published var summary: [MovieSummary] = []
	
	init() {
		getPopularMovies()
	}

	func getPopularMovies() {
		Task {
				do {
					let movies = try await MoviesClient(apiKey: Constants.apiKey).popularMovies()
					self.summary = movies
				} catch {
						print("Request failed with error: \(error)")
				}
		}
	}
}
