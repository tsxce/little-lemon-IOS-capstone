//
//  Menu.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/10.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    var body: some View {
        VStack {
            Text("APP TITLE")
            Text("Tokyo")
            Text("a short description of the whole application below the previous two fields. ")
            TextField("Search menu",  text: $searchText)
            FetchedObjects(predicate:buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            Text(dish.title ?? "")
                            Text(dish.price ?? "")
                        }
                    }
                }
            }
        }.onAppear() {
            getMenuData()
        }
    }
    func getMenuData() {
        let persistence = PersistenceController()
        persistence.clear()

        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let string = String(data: data, encoding: .utf8) {
                let menuData = string.data(using: .utf8)!
                let decoder = JSONDecoder()
                let menus = try! decoder.decode(MenuList.self, from: menuData)
                for menuItem in menus.menu {
                    let newDish = Dish(context: viewContext)// Dish is from database entitls
                    newDish.title = menuItem.title
                    newDish.image = menuItem.image
                    newDish.price = menuItem.price
                }
                try? viewContext.save()
            } else {
                print("what the fuck")
            }
        }
        task.resume()
    }
    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate{
        if searchText == "" {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
