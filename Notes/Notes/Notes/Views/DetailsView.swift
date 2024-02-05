//
//  DetailsView.swift
//  Notes
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct DetailView: View {
    @State private var editedText: String
    @State private var fileName: String
    let note: Note
    let viewModel: NoteViewModel
    
    init(note: Note, viewModel: NoteViewModel) {
        self.note = note
        self.viewModel = viewModel
        _editedText = State(initialValue: note.text)
        _fileName = State(initialValue: note.fileName)
        
        
    }
    
    var body: some View {
        VStack {
            TextField("",
                      text: $fileName,
                      prompt: Text("Type your file name..."),
                      axis: .vertical)
            .bold()
            .padding(16)
            .lineSpacing(5)
            .cornerRadius(16)
            .multilineTextAlignment(.center)
            
            TextField("",
                      text: $editedText,
                      prompt: Text("Type your note..."),
                      axis: .vertical)
            .padding(16)
            .lineSpacing(5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(16)
            
            Spacer()

            Button("Update") {
                viewModel.updateNote(note,
                                     newText: editedText,
                                     newFileName: fileName)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    DetailView(note: Note(fileName: "ed",
                          text: "Sample Note"),
               viewModel: NoteViewModel())
}
