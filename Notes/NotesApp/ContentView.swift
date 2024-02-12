import SwiftUI

struct ContentView: View {
    @State private var filesAndNotes = [FileNote]()

    var body: some View {
        NavigationView {
            List(filesAndNotes.indices, id: \.self) { index in
                NavigationLink(destination: NoteDetailView(noteIndex: index, filesAndNotes: $filesAndNotes)) {
                    Text(filesAndNotes[index].fileName)
                }
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: NavigationLink(destination: AddNoteView(filesAndNotes: $filesAndNotes)) {
                Image(systemName: "plus")
            })
        }
        .onAppear {
            loadNotesFromFiles()
        }
        .preferredColorScheme(.dark)
    }

    private func loadNotesFromFiles() {
        do {
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(docURL)
            let directoryContents = try fm.contentsOfDirectory(at: docURL, includingPropertiesForKeys: nil)
            filesAndNotes.removeAll()
            for fileURL in directoryContents {
                let fileName = fileURL.lastPathComponent
                if let note = FileNote.readFromFile(fileName: fileName) {
                    filesAndNotes.append(note)
                }
            }
        } catch {
            print("Error loading notes from files: \(error.localizedDescription)")
        }
    }
}




#Preview {
    ContentView()
}
