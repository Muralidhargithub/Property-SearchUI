import UIKit

class CollectionVC: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 20 // rows
        layout.minimumInteritemSpacing = 10 // items
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for property for rent"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    // Add a placeholder for the verified user card
    let collectionItems: [(String?, String?)] = [
        ("Property for Rent", "house"),
        ("Property for Sale", "building.2"),
        ("Off-Plan Properties", "map"),
        ("Rooms for Rent", "door.right.hand.open"),
        ("Motors", "car"),
        ("Jobs", "briefcase"),
        ("Classifieds", "newspaper"),
        ("Furniture & Garden", "sofa"),
        ("Community", "person.2"),
        (nil, nil),
        (nil, "horizontalScroll")// Placeholder for Verified User Card
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
        setupCollectionView()
    }
    
    private func setupSearchBar() {
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionView.register(CellCollection.self, forCellWithReuseIdentifier: CellCollection.identifier)
        collectionView.register(VerifiedUserCardCell.self, forCellWithReuseIdentifier: VerifiedUserCardCell.identifier)
        collectionView.register(HorizontalScrollCell.self, forCellWithReuseIdentifier: HorizontalScrollCell.identifier)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Verified User Card Cell
        if indexPath.row == collectionItems.count - 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerifiedUserCardCell.identifier, for: indexPath) as? VerifiedUserCardCell else {
                return UICollectionViewCell()
            }
            cell.configure(
                title: "Become a verified user",
                subtitle: "Build Trust\nGet increased visibility\nUnlock Exclusive rewards",
                buttonText: "Get started.",
                badgeImage: UIImage(systemName: "checkmark.circle.fill")!
            )
            return cell
        }
        
        // Horizontal Scroll Cell
        if collectionItems[indexPath.row].1 == "horizontalScroll" {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalScrollCell.identifier, for: indexPath) as? HorizontalScrollCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: ["house1", "house2", "house3", "house4", "house5"]) // Replace with your image names
            return cell
        }
        
        // Regular Cells
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollection.identifier, for: indexPath) as? CellCollection else {
            return UICollectionViewCell()
        }
        let item = collectionItems[indexPath.row]
        cell.configure(with: item.0!, imageName: item.1!)
        return cell
    
    }
}

extension CollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == collectionItems.count - 1 {
            // Larger size for Verified User Card
            return CGSize(width: collectionView.frame.width , height: 150)
        }else if indexPath.row == collectionItems.count - 2 {
            // Larger size for Verified User Card
            return CGSize(width: collectionView.frame.width , height: 150)
        } else {
            // Default size for other items
            return CGSize(width: 100, height: 100)
        }
    }
}

extension CollectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == collectionItems.count - 1 {
            print("Verified user card tapped")
        } else {
            let item = collectionItems[indexPath.row]
            print("Selected: \(item.0 ?? "")")
        }
    }
}
