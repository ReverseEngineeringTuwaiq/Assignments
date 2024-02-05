//
//  NotesListView.swift
//  Notes
//
//  Created by istabraq on 23/07/1445 AH.
//

import SwiftUI

struct NotesListView: View {
    @State private var notes: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes, id: \.self) { note in
                        Text(note)
                    }
                }
                .navigationBarTitle("Notes")
                .navigationBarItems(trailing:
                    NavigationLink(destination: WriteNotes()) {
                        Image(systemName: "plus")
                    }
                )
            }
        }
        .onAppear(perform: loadNotes)
    }

    private func loadNotes() {
        guard let notesURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }

        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: notesURL, includingPropertiesForKeys: nil)
            notes = fileURLs.map { $0.deletingPathExtension().lastPathComponent }
        } catch {
            print("Error loading notes: \(error.localizedDescription)")
        }
    }
}


    private func addNote() {
        let _ = WriteNotes()

    }





#Preview {
    NotesListView()
}
