//
//  DetalleView.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class DetalleView: UIViewController {

    
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelPopularidad: UILabel!
    @IBOutlet weak var promedioVotos: UILabel!
    @IBOutlet weak var labelFecha: UILabel!
    @IBOutlet weak var labelLenguaje: UILabel!
    @IBOutlet weak var labelResumen: UILabel!
    // MARK: Properties
    var presenter: DetallePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { [weak self] in
                self?.imgPoster.image = UIImage(data: data)
            }
        }
    }
}

extension DetalleView: DetalleViewProtocol {
    // TODO: implement view output methods
    func showDetalle(data:movieModel.Results){
        let url = URL(string: "https://image.tmdb.org/t/p/w500" + data.poster_path)!
        downloadImage(url: url)
        labelTitulo.text = "Titulo: " +  data.title
        labelPopularidad.text = "Popularidad: " +  String(format: "%.2f", data.popularity)
        promedioVotos.text = "Votos: " +  String(format: "%.2f", data.vote_average)
        labelFecha.text = "Fecha Estreno: " +  data.release_date
        labelLenguaje.text = "Lenguaje Original: " +  data.original_language
        labelResumen.text = "Resumen: " +  data.overview
    }
}
