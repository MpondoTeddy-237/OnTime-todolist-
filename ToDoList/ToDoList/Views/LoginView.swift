//
//  LoginView.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack{
                HeaderView(title: "Your ToDo Buddy!", subtitle: "Organise yourself, Get things done", angle: 15, background: .blue)
                
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                TLButton(title: "Log In", background: .blue){
                    viewModel.login()
                    
                        }
                        .padding()
                    }
                    .offset(y: -50)
                
                
                //Create Account
                VStack {
                    Text("New arround here ?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
