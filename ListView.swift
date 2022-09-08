//
//  ListView.swift
//  ToDoList
//
//  Created by David on 1/10/22.
//

import SwiftUI

struct ListView: View {
    
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                 No_items_view()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                
            }
        }
        .navigationTitle("To Do List 📝")  
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add New", destination: AddView()))
    }
    
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
.previewInterfaceOrientation(.portrait)
    }
}


