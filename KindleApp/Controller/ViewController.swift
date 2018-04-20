//
//  ViewController.swift
//  KindleApp
//
//  Created by Sujal on 7/22/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView() // to not display uncessary rows
        navigationItem.title = "Kindle"
        setupBooks()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPagerController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: bookPageController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        let book = books?[indexPath.row]
        cell.book = book
        //cell.textLabel?.text = book?.title
        //cell.imageView?.image = book?.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count{
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func setupBooks(){
        let page1 = Pages(number: 1, text: "This is page number 1")
        let page2 = Pages(number: 2, text: "This is page number 2")
        let pages = [page1,page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Issacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
        let book2 = Book(title: "Bill Gates a Journal", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"), pages: [
            Pages(number: 1, text: "Bill gates Journey"),
            Pages(number: 2, text: "Mircosfot Foundation"),
            Pages(number: 3, text: "Business Boom"),
            Pages(number: 4, text: "Globalization")
            ])
        
        books = [book, book2]
    }
}

