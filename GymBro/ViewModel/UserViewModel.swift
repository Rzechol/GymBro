//
//  UserViewModel.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserViewModel: ObservableObject {
    
    @Published var user: UserModel?
    
    @Published var showingAlert : Bool = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    var userIsGuest: Bool = false
    
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){ (result, error) in
            if error != nil{
                self.alertTitle = "Error"
                self.alertMessage = error?.localizedDescription ?? "Something went wrong"
                self.showingAlert = true
            } else {
                DispatchQueue.main.async{
                    self.add(UserModel(userEmail: email))
                    self.sync()
                }
            }
        }
    }
    
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){ (result, error) in
            if error != nil{
                self.alertTitle = "Errors"
                self.alertMessage = error?.localizedDescription ?? "Something went wrong"
                self.showingAlert = true
            } else {
                DispatchQueue.main.async{
                    //Success
                    self.sync()
                    
                }
            }
        }
    }
    
    func singInAnonymously(){
        auth.signInAnonymously(){ authResult, error in
            guard let user = authResult?.user else { return }
            self.userIsGuest = user.isAnonymous
            DispatchQueue.main.async{
                //Success
                self.add(UserModel(userEmail: "guest"))
                self.sync()
                
            }
        }
        
    }
    
    func resetPassword(email: String){
        auth.sendPasswordReset(withEmail: email) { error in
            if error != nil{
                self.alertTitle = "Error"
                self.alertMessage = error?.localizedDescription ?? "Something went wrong"
                self.showingAlert = true
            } else {
                self.alertTitle = "Succes"
                self.alertMessage = "A Password change request has been sent to your email adress."
                self.showingAlert = true
            }
        }
        
    }
    
    func signOut(){
        do{
            try auth.signOut()
            self.user = nil
        }
        catch{
            print("Error signing out user: \(error)")
        }
    }
    
    
    func sync(){
        guard userIsAuthenticated else { return }
        db.collection("Users").document(self.uuid!).getDocument { document, error in
            guard document != nil, error == nil else { return }
            do{
                try self.user = document!.data(as: UserModel.self)
            } catch{
                print("sync error: \(error)")
            }
        }
        
    }
    
    private func add(_ user: UserModel){
        guard userIsAuthenticated else { return }
        do {
            let _ = try db.collection("Users").document(self.uuid!).setData(from: user)
            
        } catch {
            print("Error adding: \(error)")
        }
    }
    
    private func update(){
        guard userIsAuthenticatedAndSynced else { return }
        do{
            let _ = try db.collection("Users").document(self.uuid!).setData(from: user)
        } catch{
            print("error updating \(error)")
        }
    }
}

