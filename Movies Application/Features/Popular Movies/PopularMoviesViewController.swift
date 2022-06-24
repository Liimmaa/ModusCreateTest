//
//  Copyright © Modus Create. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PopularMoviesViewController: UICollectionViewController {
	init() {
		let layout = UICollectionViewFlowLayout()
		super.init(collectionViewLayout: layout)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Popular"
	}
	
	@available(*, unavailable)
	required init?(coder _: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
