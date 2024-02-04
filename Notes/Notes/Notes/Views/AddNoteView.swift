//
//  AddNoteView.swift
//  Notes
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel = NoteViewModel()
    @State private var fileName = ""
    @State private var newNote = ""

    init(viewModel: NoteViewModel) {
        self.viewModel = viewModel
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
                      text: $newNote,
                      prompt: Text("Type your note..."),
                      axis: .vertical)
            .padding(16)
            .lineSpacing(5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(16)
            
            Spacer()

            Button("Save") {
                viewModel.addNote(fileName: fileName, newNote)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddNoteView(viewModel: NoteViewModel())
}
