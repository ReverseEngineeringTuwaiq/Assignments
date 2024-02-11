import SwiftUI

struct Note: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var content: String
}

class NoteManager: ObservableObject {
    static let shared = NoteManager()
    
    @Published var notes: [Note] = []
    let fileManager = FileManager.default
    
    func loadNotes() {
        do {
            let directoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let files = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            notes = try files.map { fileURL in
                let content = try String(contentsOf: fileURL)
                let filename = fileURL.lastPathComponent
                let title = filename.replacingOccurrences(of: ".txt", with: "")
                return Note(title: title, content: content)
            }
        } catch {
            print("Error loading notes: \(error)")
        }
    }
    
    func saveNote(_ note: Note) {
        do {
            let directoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = directoryURL.appendingPathComponent("\(note.title).txt")
            try note.content.write(to: fileURL, atomically: true, encoding: .utf8)
            loadNotes() // Reload notes after saving
        } catch {
            print("Error saving note: \(error)")
        }
    }
}

struct ContentView: View {
    @StateObject private var noteManager = NoteManager.shared
    @State private var selectedNote: Note?
    
    
    init(){
        do{
            let tempPath = FileManager.default
            let docURL = try tempPath.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(docURL)
        }catch{}
        
        
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], spacing: 16) {
                    ForEach(noteManager.notes) { note in
                        CardView(note: note)
                            .onTapGesture {
                                selectedNote = note
                            }
                    }
                }
            }
            .padding()
            .navigationTitle("Notes")
            .sheet(item: $selectedNote) { note in
                NoteDetailView(note: note)
            }
            .onAppear {
                noteManager.loadNotes()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: AddNoteView(noteManager: noteManager),
                        label: {
                            Image(systemName: "plus")
                        }
                    )
                }
            }
        }
    }
}

struct CardView: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
            
            Text(note.content)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text("Stored at: \(getStorageLocation(for: note))")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
    
    private func getStorageLocation(for note: Note) -> String {
        let directoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = directoryURL?.appendingPathComponent("\(note.title).txt")
        return fileURL?.path ?? "Unknown"
    }
}

struct NoteDetailView: View {
    var note: Note
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
            
            Text(note.content)
                .padding()
            
            Spacer()
            
            Text("Stored at: \(getStorageLocation(for: note))")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Note Detail")
    }
    
    private func getStorageLocation(for note: Note) -> String {
        let directoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = directoryURL?.appendingPathComponent("\(note.title).txt")
        return fileURL?.path ?? "Unknown"
    }
}

struct AddNoteView: View {
    @State private var newNote = Note(title: "", content: "")
    var noteManager: NoteManager
    
    var body: some View {
        VStack {
            TextField("Title", text: $newNote.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $newNote.content)
                .padding()
        }
        .navigationTitle("Add Note")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    noteManager.saveNote(newNote)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
