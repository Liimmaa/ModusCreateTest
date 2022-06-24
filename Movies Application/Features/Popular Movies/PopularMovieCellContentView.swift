//
//  Copyright © Modus Create. All rights reserved.
//

import SwiftUI

extension PopularMovieCell {
	struct ContentView: View {
		let summary: MovieSummary
		
		var body: some View {
			GeometryReader { geo in
				VStack(spacing: 0) {
					AsyncImage(url: summary.thumbnailURL, content: {
						image in
						image
							.resizable()
							.clipShape(Circle())
							.frame(width: geo.size.width * 0.9, height: geo.size.height * 0.6)
					}, placeholder: {
						Color.white
					})
					.overlay(
						summary.isPopular
						? Circle().stroke(Color.purple, style: StrokeStyle(lineWidth: 5, dash: [15]))
						: nil
					)
					
					Spacer()
					
					VStack(alignment: .leading, spacing: 4) {
						Text(summary.title)
							.padding(4)
							.fixedSize(horizontal: false, vertical: true)
							.font(.headline)
							.background(Color.gray.opacity(0.2))
							.overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.yellow, lineWidth: 1))
							.multilineTextAlignment(.leading)
						
						Text(summary.overview)
							.font(.subheadline)
							.lineLimit(3)
						
					}
					.padding(.horizontal, 6)
					.frame(width: geo.size.width, height: geo.size.height * 0.4)
				}
			}
		}
	}
}

struct PopularMovieCellContentView_Previews: PreviewProvider {
	static var previews: some View {
		PopularMovieCell.ContentView(summary: .example)
			.previewLayout(.fixed(width: 200, height: 350))
	}
}
