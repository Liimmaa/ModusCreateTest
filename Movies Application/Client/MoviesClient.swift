//
//  Copyright © Modus Create. All rights reserved.
//

import Foundation

enum ErrorValidation: Error {
	case defaultError
}

public class MoviesClient {
	let apiKey: String
	let baseUrl: URL
	
	public init(apiKey: String) {
		self.apiKey = apiKey
		
		guard let url = URL(string: "https://api.themoviedb.org/3/") else {
			preconditionFailure("Unable to build URL")
		}
		self.baseUrl = url
	}
	
	public func popularMovies() async throws -> [MovieSummary] {
		guard let url = URL(string: "\(baseUrl)movie/popular?api_key=\(apiKey)&language=en-US&page=1") else {
			throw ErrorValidation.defaultError
		}
		
		// Use the async variant of URLSession to fetch data
		let (data, _) = try await URLSession.shared.data(from: url)
		
		// Parse the JSON data
		let movieResult = try JSONDecoder().decode(MoviesGallery.self, from: data)
		return movieResult.results
	}
	
	public func movieDetails(_ id: Int) async throws -> MovieDetails {
		guard let url = URL(string: "\(baseUrl)movie/\(id)?api_key=\(apiKey)&language=en-US") else {
			throw ErrorValidation.defaultError
		}
		
		let (data, _) = try await URLSession.shared.data(from: url)
		
		let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
		return movieDetails
	}
}
