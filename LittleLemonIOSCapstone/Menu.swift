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
                HeroView()
                Spacer()
                        .frame(height: 0)
                ZStack(alignment: .leading) {
                    TextField("", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(15)
                        .background(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                    Button(action: {
                        //Some button action
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
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .frame(width: 35, height: 35)
                    .padding(.leading, 20)
                }
                VStack {
                    Text("ORDER FOR DELIVERY!")
                        .padding([.leading], 15)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("Starters")
                            .bold()
                            .padding([.top, .bottom, .leading, .trailing], 12)
                            .foregroundColor(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .onTapGesture {
                                self.searchText = ""
                                self.category = "starters"
                            }
                        Text("Mains")
                            .bold()
                            .padding([.top, .bottom, .leading, .trailing], 12)
                            .foregroundColor(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .onTapGesture {
                                self.searchText = ""
                                self.category = "mains"
                            }
                        Text("Desserts")
                            .bold()
                            .padding([.top, .bottom, .leading, .trailing], 12)
                            .foregroundColor(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .onTapGesture {
                                self.searchText = ""
                                self.category = "desserts"
                            }
                        Text("Drinks")
                            .bold()
                            .padding([.top, .bottom, .leading, .trailing], 12)
                            .foregroundColor(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .onTapGesture {
                                self.searchText = ""
                                self.category = "drinks"
                            }
                    }
                }
                .padding([.bottom], 5)
                Divider()
                 .frame(height: 1)
                 .background(Color.gray)
                FetchedObjects(predicate:buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            HStack {
                                VStack {
                                    Text(dish.title ?? "")
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(dish.desc ?? "")
                                        .foregroundColor(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.top, .bottom], 6)
                                    let priceStr = "$ " + (dish.price ?? "")
                                    Text(priceStr)
                                        .foregroundColor(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 100)
                            }
                            .padding([.top, .bottom], 10)
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 10)
            .onAppear() {
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
                    newDish.desc = menuItem.description
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
