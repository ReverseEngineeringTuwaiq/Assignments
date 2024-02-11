import SwiftUI

struct NoteEditor: View {
    @State var note: Note
    @Binding var shouldRefresh: Bool
    var body: some View {
        VStack {
            Text(note.filename)
                .font(.largeTitle)
            
            TextEditor(text: $note.content)
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Save") {
            FileManagerHelper.shared.save(note: note)
            shouldRefresh = true
        })
    }
}
