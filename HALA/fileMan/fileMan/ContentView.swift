

import SwiftUI


struct FileManagerCRUD: View {
    
    init() {
//        createFile(filename: "bmw.txt", folderName: "myfolder", content: "it is very nice car")
        readFile()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func createFile(filename: String, folderName: String, content: String){
        do{
            let fm = FileManager.default
            let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let folderURL = docURL.appendingPathComponent(folderName)
            let fileURL = folderURL.appendingPathComponent(filename)
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            print(fileURL)
        }catch{
            print(error)
        }
    }
    
    func readFile(){
        do{
        let folderName = "myfolder"
        let fm = FileManager.default
        let docURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let folderURL = docURL.appendingPathComponent(folderName)
        let directoryContents = try fm.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)
            
            for fileURL in directoryContents{
                print("Founds \(fileURL.lastPathComponent)")
            }
            
        }catch{
            
        }
    }
}//: STRUCT

#Preview {
    FileManagerCRUD()
}
 

