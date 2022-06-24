//
//  Copyright © Modus Create. All rights reserved.
//

import UIKit

class PopularMoviesViewController: UICollectionViewController {
	var viewModel: MoviesGalleryViewModel
	
	init() {
		let viewModel = MoviesGalleryViewModel()
		self.viewModel = viewModel
		let layout = UICollectionViewFlowLayout()
		super.init(collectionViewLayout: layout)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = Constants.title
		
		setupCollectionView()
	}
	
	private func setupCollectionView() {
		collectionView.register(PopularMovieCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
		let spacing = Constants.spacing
		let width = (view.frame.width-30)/2
		let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
		layout.itemSize = CGSize(width: width, height: width * 1.5)
		layout.minimumInteritemSpacing = spacing
		layout.minimumLineSpacing = spacing

		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	@available(*, unavailable)
	required init?(coder _: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PopularMoviesViewController {
	
		override func numberOfSections(in collectionView: UICollectionView) -> Int {
			return 1
		}
	
		override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			return viewModel.summary.count
		}
		
		override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PopularMovieCell
			// Configure the cell
			cell.summary = viewModel.summary[indexPath.row]
			return cell
		}
}
