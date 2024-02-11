//
//  AuthService.swift
//  EVStationProject
//
//  Created by istabraq on 29/07/1445 AH.
//

import Supabase
import Foundation

class SupabaseAuth {
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://uizmwjzebkwygmpvoiyg.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpem13anplYmt3eWdtcHZvaXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUxODUsImV4cCI6MjAyMjc4MTE4NX0.pnKJnZn0DGPUsldbSjPg-n36RYPP18Jc3CMzxiRq2v8")
    
    func LoginUser() async throws {
        do{
            let session = try await client.auth.session
            
        }catch let error{
            throw error
        }
    }
    
    func SignIn(email:String,password:String) async throws {
        do{
            try await client.auth.signIn(email: email.lowercased(), password: password)
        }catch let error{
            throw error
        }
    }
    
    
    func SignUp(email:String,password:String) async throws{
        do{
            try await client.auth.signUp(email: email.lowercased(), password: password)
        }catch let error{
            throw error
        }
    }
    
    func signOut() async throws{
        do{
            try await client.auth.signOut()
        }catch let error{
            throw error
        }
    }
}
