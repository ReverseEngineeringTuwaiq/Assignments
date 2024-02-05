//
//  NoteViewModel.swift
//  Notes
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []

    init() {
        loadNotes()
        
//        // Get the document directory URL
//        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            // The path to the document directory
//            let documentDirectoryPath = documentDirectory.path
//            print("Document Directory Path: \(documentDirectoryPath)")
//        } else {
//            print("Unable to access the document directory.")
//        }

        
        do{
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil , create: false)
           // let folderURL = docURL.appendingPathComponent(folder)
        }catch{
            print(error)
        }
        
        
    }

    func loadNotes() {
        guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("notes.json") else {
            return
        }

        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            notes = try decoder.decode([Note].self, from: data)
        } catch {
            print("Error loading notes: \(error)")
        }
    }

    func addNote(fileName: String, _ note: String) {
        let newNote = Note(fileName: fileName, text: note)
        notes.append(newNote)
        saveNotes()
    }

    func updateNote(_ note: Note, newText: String, newFileName: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].text = newText
            notes[index].fileName = newFileName
            saveNotes()
        }
    }

    func deleteNote(_ note: Note) {
        notes.removeAll { $0.id == note.id }
        saveNotes()
    }

    func saveNotes() {
        guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("notes.json") else {
            return
        }

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(notes)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Error saving notes: \(error)")
        }
    }
}
