import UIKit

class OrderViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let menuImageView = UIImageView()
    let addToCartButton = UIButton(type: .system)
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let menuOptionsSegmentedControl = UISegmentedControl(items: ["엽기 떡볶이", "엽기오뎅", "엽기반반", "엽기분모자떡볶이"])
    var selectedOption: String = "엽기 떡볶이"
    var price: Int = 14000
    var cart: [OrderFood] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupScrollView()
        setupImageView()
        setupLabels()
        setupSegmentedControl()
        setupAddToCartButton()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupImageView() {
        contentView.addSubview(menuImageView)
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.contentMode = .scaleAspectFill
        menuImageView.clipsToBounds = true
        menuImageView.image = UIImage(named: "img1")
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuImageView.heightAnchor.constraint(equalTo: menuImageView.widthAnchor, multiplier: 1/2)
        ])
    }
    
    private func setupLabels() {
        setupNameLabel()
        setupDescriptionLabel()
        setupPriceLabel()
    }

    private func setupNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabel.text = "엽기떡볶이"
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "분모자떡볶이 선택 시, 떡이 분모자로 변경됩니다."
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func setupPriceLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.boldSystemFont(ofSize: 22)
        priceLabel.text = "\(price)원"
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func setupSegmentedControl() {
        contentView.addSubview(menuOptionsSegmentedControl)
        menuOptionsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuOptionsSegmentedControl.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            menuOptionsSegmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuOptionsSegmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        menuOptionsSegmentedControl.addTarget(self, action: #selector(menuOptionChanged), for: .valueChanged)
    }

    private func setupAddToCartButton() {
        contentView.addSubview(addToCartButton)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.setTitle("\(price)원 담기", for: .normal)
        addToCartButton.backgroundColor = .systemMint
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.layer.cornerRadius = 25
        NSLayoutConstraint.activate([
            addToCartButton.topAnchor.constraint(equalTo: menuOptionsSegmentedControl.bottomAnchor, constant: 20),
            addToCartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addToCartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            addToCartButton.heightAnchor.constraint(equalToConstant: 50),
            addToCartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        addToCartButton.addTarget(self, action: #selector(addToCartPressed), for: .touchUpInside)
    }

    @objc private func menuOptionChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        selectedOption = sender.titleForSegment(at: selectedIndex) ?? "엽기 떡볶이"
        updatePrice(for: selectedIndex)
    }

    @objc func addToCartPressed() {
        let selectedIndex = menuOptionsSegmentedControl.selectedSegmentIndex
        let selectedOption = menuOptionsSegmentedControl.titleForSegment(at: selectedIndex) ?? "엽기 떡볶이"
        let newOrder = OrderFood(name: selectedOption, price: price, menu: selectedIndex, quantity: 1)
        cart.append(newOrder)

        // 데이터 넘기기 ??? ㅇㅇ
        let cartViewController = CartViewController()
        cartViewController.cart = cart
        navigationController?.pushViewController(cartViewController, animated: true)
    }

    private func updatePrice(for optionIndex: Int) {
        switch optionIndex {
        case 3:
            price = 17000
        default:
            price = 14000
        }
        priceLabel.text = "\(price)원"
        addToCartButton.setTitle("\(price)원 담기", for: .normal)
    }
}
