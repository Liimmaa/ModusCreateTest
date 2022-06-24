//
//  Copyright © Modus Create. All rights reserved.
//

import SwiftUI

extension PopularMovieCell {
	struct ContentView: View {
		let summary: MovieSummary
		
		var body: some View {
			ZStack(alignment: .bottom) {
				Color.black
			}
			.ignoresSafeArea()
		}
	}
}

struct PopularMovieCellContentView_Previews: PreviewProvider {
	static var previews: some View {
		PopularMovieCell.ContentView(summary: .example)
			.previewLayout(.fixed(width: 200, height: 350))
	}
}
