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
    @State var category = ""
    var body: some View {
        VStack {
            HeaderView()
            VStack(spacing: 0) {
                HeroView()
                    .padding([.top, .bottom], 0)
                TextField("Search menu",  text: $searchText)
                    .background(Color.mint)
                    .padding([.top, .bottom], 0)
            }
            VStack {
                Text("ORDER FOR DELIVERY!")
                    .padding([.leading], 15)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("Starters")
                        .padding([.top, .bottom, .leading, .trailing], 15)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.searchText = ""
                            self.category = "starters"
                        }
                    Text("Mains")
                        .padding([.top, .bottom, .leading, .trailing], 15)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.searchText = ""
                            self.category = "mains"
                        }
                    Text("Desserts")
                        .padding([.top, .bottom, .leading, .trailing], 15)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.searchText = ""
                            self.category = "desserts"
                        }
                    Text("Drinks")
                        .padding([.top, .bottom, .leading, .trailing], 15)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.searchText = ""
                            self.category = "drinks"
                        }
                }
            }
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
                    newDish.category = menuItem.category
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
        if category != "" {
            switch category {
                case "starters":
                    return NSPredicate(format: "category CONTAINS[cd] %@", "starters")
                case "desserts":
                    return NSPredicate(format: "category CONTAINS[cd] %@", "desserts")
                case "mains":
                    return NSPredicate(format: "category CONTAINS[cd] %@", "mains")
            case "drinks":
                return NSPredicate(format: "category CONTAINS[cd] %@", "drinks")
                default:
                    return NSPredicate(format: "category CONTAINS[cd] %@", "starters")
            }
        }
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
