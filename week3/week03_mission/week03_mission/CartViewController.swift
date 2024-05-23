import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var cart: [OrderFood] = [
        OrderFood(name: "엽기떡볶이", price: 14000, menu: 0, quantity: 1)
    ]

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "장바구니"
        view.backgroundColor = .white
        setupTableView()
        tableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.identifier)
    }

    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.identifier, for: indexPath) as? CartItemCell else {
            return UITableViewCell()
        }
        let item = cart[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

class CartItemCell: UITableViewCell {
    static let identifier = "CartItemCell"

    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(foodImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(quantityLabel)

        NSLayoutConstraint.activate([
            foodImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            foodImageView.widthAnchor.constraint(equalToConstant: 60),
            foodImageView.heightAnchor.constraint(equalToConstant: 60),

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 12),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 12),
            
            quantityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            quantityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }

    func configure(with item: OrderFood) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)원"
        quantityLabel.text = "x\(item.quantity)"
        foodImageView.image = UIImage(named: "img2")
    }
}
