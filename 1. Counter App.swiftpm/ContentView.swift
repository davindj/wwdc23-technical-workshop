import SwiftUI

struct ContentView: View {
    @State var counter = 0
    var body: some View {
        NavigationView{
            VStack{
                Text("Counter App")
                    .font(.system(size: 64))
                Spacer().frame(height: 20) // untuk memberi jarak
                Text("Counter: \(counter)")
                    .font(.system(size: 32))
                Button("Increase", action: { // action adalah code yang dijalankan ketika button ditekan
                    counter += 1
                })
                .font(.system(size: 32))
                .buttonStyle(.borderedProminent) // memberikan Style pada button
                NavigationLink(destination: SecondPage(counter: counter)) {
                    Text("Navigate")
                }
                .font(.system(size: 32))
                .buttonStyle(.bordered)
            }
        }
        .navigationViewStyle(.stack)
    }
}
struct SecondPage: View {
    var counter: Int
    
    var body: some View {
        VStack{
            Text("Second Page")
                .font(.system(size: 64))
            Spacer().frame(height: 20)
            Text("Counter: \(counter)")
                .font(.system(size: 32))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
