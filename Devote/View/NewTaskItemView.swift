//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Halil Usanmaz on 24.07.2022.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTY
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false;
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Binding var isShowing: Bool;
    
    // MARK: -FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.id = UUID()
            newItem.completion = false
            newItem.task = task
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16){
                TextField("New Task",text: $task)
                    .padding()
                    .background(isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    addItem()
                },label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24,weight: .bold ,design: .rounded))
                    Spacer()
                    
                })//:BUTTON
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(12)
                
            }//: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.6), radius: 24)
            .frame(maxWidth: 640)
            
        }//:VSTACK
        .padding()
    }
}

    // MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
