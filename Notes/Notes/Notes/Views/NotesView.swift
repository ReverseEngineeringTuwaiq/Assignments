//
//  NotesView.swift
//  Notes
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct NotesView: View {
    @StateObject var viewModel = NoteViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(destination: AddNoteView(viewModel: viewModel)) {
                    Image(systemName: "plus.circle.fill")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.system(size: 30))
                        .padding(.trailing, 10)
                        .foregroundColor(.black)
                }
                
                Divider()
                
                if viewModel.notes.isEmpty {
                    Text("There are no notes")
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.notes) { note in
                            NavigationLink(destination: DetailView(note: note,
                                                                   viewModel: viewModel)) {
                                Text(note.fileName)
                                    .lineLimit(2)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            if let index = indexSet.first {
                                viewModel.deleteNote(viewModel.notes[index])
                            }
                        })
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Notes")
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
