//
//  AddNoteView.swift
//  NotesApp
//
//  Created by Abdulrahim on 23/07/1445 AH.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var filesAndNotes: [FileNote]

    @State private var fileName: String = ""
    @State private var noteContent: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("File Name", text: $fileName)
                TextEditor(text: $noteContent)
            }
            .navigationBarTitle("Add Note", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                saveNote()
            })
        }
    }

    private func saveNote() {
        guard !fileName.isEmpty && !noteContent.isEmpty else {
            return
        }
        let newNote = FileNote(fileName: fileName, noteContent: noteContent)
        newNote.saveToFile()
        filesAndNotes.append(newNote)
        presentationMode.wrappedValue.dismiss()
    }
}
