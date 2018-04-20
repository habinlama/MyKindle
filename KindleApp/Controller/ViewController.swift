//
//  ViewController.swift
//  KindleApp

import UIKit
class ViewController: UITableViewController {
    var books: [Book]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tableView.separatorColor = UIColor(white: 1, alpha: 0.4)
        navigationItem.title = "Kindle"
        fetchBooks()
        setupNavBarStyle()
        setupNavBarButtons()
    }
    
    func setupNavBarStyle(){
        navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
    }
    
    func setupNavBarButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftBtnClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftBtnClicked))
    }
    
    @objc func leftBtnClicked(){
    }
    
    func fetchBooks(){
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else { return }
        
        //performs this task asynchronously in the background thread
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error{
                print("Failed to fetch the json data: ", err)
                return
            }
            guard let data = data else { return }
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                //downcast json as array of dictionary having indicator as string and data as any
                guard let bookDictionary = json as? [[String: Any]] else { return }
                self.books = []
                for bookDictionary in bookDictionary{
                    let book = Book(bookDictionary: bookDictionary)
                    self.books?.append(book)
                }
                
                //load the data or show the data in the main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               // print(json)
            }catch let jsonError{
                print("Failed to parse json properly: ", jsonError)
            }
        }).resume()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books?[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPagerController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: bookPageController)
        
        bookPageController.book = selectedBook
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        let book = books?[indexPath.row]
        cell.book = book
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    //footer
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FooterView()
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

