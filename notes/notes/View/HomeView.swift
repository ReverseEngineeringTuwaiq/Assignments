import SwiftUI

struct HomeView: View {
    @State var notes: [Note] = FileManagerHelper.shared.loadNotes()
    @State var refreshTrigger = false
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink(destination: AddNoteView(shouldRefresh: $refreshTrigger)) {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Create a new note")
                    }
                }
                List(notes) { note in
                    NavigationLink(destination: NoteEditor(note: note, shouldRefresh: $refreshTrigger)) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                            .frame(height: 100)
                            .overlay(
                                Text(note.filename)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            )
                    }
                    
                }
                .navigationBarTitle("Notes")
            }
            .onChange(of: refreshTrigger) {
                notes = FileManagerHelper.shared.loadNotes()
            }
        }
    }
}

#Preview {
    HomeView()
}
