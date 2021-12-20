//
//  ViewController.swift
//  ListPublicRepositoriesWithGithub
//
//  Created by Данил Гусев on 16.12.2021.
//

import UIKit
import SnapKit

class RepositoriesViewController: UIViewController {
    
    let tableRepositories: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(RepositoriesViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()

    let vc = DetailViewController()
    
    var viewModel: RepositoriesViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RepositoriesViewModel()
        
        setupViews()
        setupDelegate()
        setupConstraints()
        setupNavigationBar()
        
        viewModel?.fetchMovies { [weak self] in
                self?.tableRepositories.reloadData()
        }
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableRepositories)
    }
    
    func setupDelegate() {
        tableRepositories.delegate = self
        tableRepositories.dataSource = self
    }
    
    func setupConstraints() {
        
        tableRepositories.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        title = "List of public repositories"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RepositoriesViewCell
        guard let tablecell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tablecell.viewModel = cellViewModel
        
        return tablecell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
