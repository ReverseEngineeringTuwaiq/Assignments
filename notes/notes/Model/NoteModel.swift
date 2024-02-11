import SwiftUI

struct Note: Identifiable{
    let id = UUID()
    let filename: String
    var content: String
}

class FileManagerHelper{
    static let shared = FileManagerHelper()
    
    private let fileManager = FileManager.default
    
    private let notesDirectoryURL: URL
    
    init() {
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        notesDirectoryURL = documentsDirectoryURL.appendingPathComponent("Notes")
        
        do {
            try fileManager.createDirectory(at: notesDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            print(notesDirectoryURL)
        } catch {
            fatalError("Failed to create notes directory: \(error)")
        }
    }
    
    func save(note: Note) {
        let fileURL = notesDirectoryURL.appendingPathComponent(note.filename)
        
        do {
            try note.content.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            fatalError("Failed to save note: \(error)")
        }
    }
    
    func loadNotes() -> [Note] {
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: notesDirectoryURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            var notes: [Note] = []
            
            for fileURL in fileURLs {
                let filename = fileURL.lastPathComponent
                
                if let content = try? String(contentsOf: fileURL) {
                    let note = Note(filename: filename, content: content)
                    notes.append(note)
                }
            }
            
            return notes
        } catch {
            fatalError("Failed to load notes: \(error)")
        }
    }
}
