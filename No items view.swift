//
//  No items view.swift
//  ToDoList
//
//  Created by David on 1/14/22.
//

import SwiftUI

struct No_items_view: View {
    
    @State var animate: Bool = false
    let SecondaryAccent = Color("Secondary Accent Color")
    
    var body: some View {
        ScrollView {
            VStack(spacing:10 ) {
                Text("There are no current items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom,20)
                Text("Click the Add New button to add an item!")
                    .padding(.bottom,40)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add New Item")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(animate ? SecondaryAccent: Color.accentColor)
                        .cornerRadius(10)
                })
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(color:  animate ? SecondaryAccent.opacity(0.7): Color.accentColor.opacity(0.9),
                            radius: animate ? 30: 10,
                            x: 0,
                            y: animate ? 50 :30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth:400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                addAnimation()
            }
            
            //use perform fill in if problems arise ^^
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity )
    }
    
    
    func addAnimation() {
        guard !animate else {  return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
     
}

struct No_items_view_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            No_items_view()
        }
        
        
        
    }
}
