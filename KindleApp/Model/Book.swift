//
//  File.swift
//  KindleApp

import UIKit
class Book{
    let title: String
    let author: String
    let pages: [Pages]
    let coverImageUrl: String
    
    init(bookDictionary: [String: Any]){
        self.title = bookDictionary["title"] as? String ?? ""
        self.author = bookDictionary["author"] as? String ?? ""
        self.coverImageUrl = bookDictionary["coverImageUrl"] as? String ?? ""
        
        var bookPages = [Pages]()
        if let pagesDictionary = bookDictionary["pages"] as? [[String: Any]]{
            for pageDictionary in pagesDictionary{
                if let pageText = pageDictionary["text"] as? String{
                    let page = Pages(number: 1, text: pageText)
                    bookPages.append(page)
                }
            }
        }
        pages = bookPages
    }
}

