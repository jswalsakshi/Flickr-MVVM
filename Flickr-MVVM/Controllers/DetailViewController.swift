//
//  DetailViewController.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, Storyboarded {

    var viewModel: DetailsViewModel?

    override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Messages"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.viewModel?.count ?? 0
      }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
      let model = self.viewModel?.getPost(index: indexPath.row)
      cell.textLabel?.text = model?.title
      cell.textLabel?.numberOfLines = 0
      cell.detailTextLabel?.text = model?.body
      if model?.isExpandable == true {
        cell.detailTextLabel?.numberOfLines = 0
      } else {
        cell.detailTextLabel?.numberOfLines = 1
      }
      return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.viewModel?.changeExapnad(index: indexPath.row)
      tableView.reloadRows(at: [indexPath], with: .fade)
    }

}
