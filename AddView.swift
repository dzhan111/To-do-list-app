//
//  AddView.swift
//  ToDoList
//
//  Created by David on 1/10/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
    
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                //NOTE CHANGE THIS TO SOMETHING MORE PLEASURABLE AND NOTICEABLE
                    .frame(height: 55)
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed , label: { Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an item ")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func saveButtonPressed() {
        if textWorks() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textWorks() -> Bool{
        if textFieldText.count < 1{
            alertTitle = "Your new item must be at least one character long 😥"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
        
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
