import SwiftUI

struct NoteDetailView: View {
    var noteIndex: Int
    @Binding var filesAndNotes: [FileNote]

    @State private var editedNoteContent: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        let note = filesAndNotes.indices.contains(noteIndex) ? filesAndNotes[noteIndex] : FileNote(fileName: "", noteContent: "")
        
        VStack {
            Text(note.fileName)
                .font(.title)
            TextEditor(text: $editedNoteContent)
                .padding()
            HStack{
                Button("Delete") {
                    deleteNote()
                }
                
                Spacer()
                
                    Button("Update") {
                        filesAndNotes[noteIndex].noteContent = editedNoteContent
                        updateNote()
                    }
            }
        }
        .padding()
    }

    private func updateNote() {
        do {
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = docURL.appendingPathComponent(filesAndNotes[noteIndex].fileName)
            try editedNoteContent.write(to: fileURL, atomically: true, encoding: .utf8)
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error updating note: \(error.localizedDescription)")
        }
    }

    private func deleteNote() {
        guard noteIndex < filesAndNotes.count else {
            print("Error: Attempted to delete note with invalid index")
            return
        }

        do {
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = docURL.appendingPathComponent(filesAndNotes[noteIndex].fileName)
            try fm.removeItem(at: fileURL)
            filesAndNotes.remove(at: noteIndex)
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error deleting note: \(error.localizedDescription)")
        }
    }
   


    init(noteIndex: Int, filesAndNotes: Binding<[FileNote]>) {
        self.noteIndex = noteIndex
        self._filesAndNotes = filesAndNotes
        _editedNoteContent = State(initialValue: filesAndNotes.wrappedValue[noteIndex].noteContent)
    }
}
