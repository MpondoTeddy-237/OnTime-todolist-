//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemsViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView(item: .init(
            id: "123",
            title: "Get milk",
            dueDate: Date().timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        ))
    }
}
