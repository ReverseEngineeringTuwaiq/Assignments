//
//  FileNote.swift
//  NotesApp
//
//  Created by Abdulrahim on 23/07/1445 AH.
//

import SwiftUI

struct FileNote: Identifiable {
    var id = UUID()
    var fileName: String
    var noteContent: String

    func saveToFile() {
        do {
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = docURL.appendingPathComponent(fileName)
            try noteContent.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("Error saving note to file: \(error.localizedDescription)")
        }
    }

    static func readFromFile(fileName: String) -> FileNote? {
        do {
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = docURL.appendingPathComponent(fileName)
            let noteContent = try String(contentsOf: fileURL)
            return FileNote(fileName: fileName, noteContent: noteContent)
        } catch {
            print("Error reading note from file: \(error.localizedDescription)")
            return nil
        }
    }
}

