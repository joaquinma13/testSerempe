//
//  ListView.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class ListView: UIViewController {
    
    
    @IBOutlet weak var tableMovie: UITableView!
    var stringCollection = [String]()
    var listMovies = [movieModel.Results]()
    
    // MARK: Properties
    var presenter: ListPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ListView: ListViewProtocol {
    // TODO: implement view output methods
    func showMovies(category: [movieModel.Results]){
        stringCollection.removeAll()
        listMovies = category
        /*for aux1 in category{
            for aux2 in aux1._links.selfito{
                stringCollection.append(aux2.href)
            }
        }*/
        for movie in category {
            stringCollection.append(movie.title)
        }
        DispatchQueue.main.async {
            self.tableMovie.reloadData()
        }
    }
}

extension ListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "celdaMovie")
        cell.textLabel?.text = stringCollection[indexPath.row]
        return cell
    }
}

extension ListView: UITableViewDelegate {
    // TODO: implement view output methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.getDataNextView(data : listMovies[indexPath.row] )
    }
}
