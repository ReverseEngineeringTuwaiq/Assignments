//
//  ContentView.swift
//  Notes
//
//  Created by istabraq on 23/07/1445 AH.
//

import SwiftUI

struct WriteNotes: View {
        @State  var noteTitle: String = ""
        @State  var noteContent: String = ""
        @State  var loadedNote: String?
        @State  var notesFilePath: URL?

        var body: some View {
            VStack {
                TextField("Enter Note Title", text: $noteTitle)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextEditor(text: $noteContent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(10)
                    .padding()
                
                Button(action: saveNote) {
                    Text("Save")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
        
        func saveNote() {
            guard !noteTitle.isEmpty && !noteContent.isEmpty else {
                return
            }
            
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let notesFileURL = documentsDirectory.appendingPathComponent("\(noteTitle).txt")
            
            do {
                try noteContent.write(to: notesFileURL, atomically: true, encoding: .utf8)
                print("Note saved successfully.")
                loadNote()
                notesFilePath = notesFileURL
                print(notesFileURL)
            } catch {
                print("Error saving note: \(error.localizedDescription)")
            }
        }
        
        func loadNote() {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let notesFileURL = documentsDirectory.appendingPathComponent("\(noteTitle).txt")
            
            do {
                let loadedNote = try String(contentsOf: notesFileURL)
                self.loadedNote = loadedNote
                print("Note loaded successfully.")
            } catch {
                print("Error loading note: \(error.localizedDescription)")
                self.loadedNote = nil
            }
        }
    }


#Preview {
    WriteNotes()
}
