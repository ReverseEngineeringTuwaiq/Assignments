import SwiftUI

struct AddNoteView: View {
    @State var filename: String = ""
    @State var content: String = ""
    @Binding var shouldRefresh: Bool
    var body: some View {
        VStack {
            TextField("FileName", text: $filename)
                .textFieldStyle(.roundedBorder)
            
            TextEditor(text: $content)
                
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Save") {
            FileManagerHelper.shared.save(note: Note(filename: filename, content: content))
            shouldRefresh = true
        })
    }
}
