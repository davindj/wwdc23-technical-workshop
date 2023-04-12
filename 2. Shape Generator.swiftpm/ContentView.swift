import SwiftUI


enum ShapeType {
    case Rectangle
    case Circle
}

struct Shape: Identifiable {
    var id: String
    
    var position: CGPoint
    var scale: CGFloat = 1.0
}

struct ContentView: View {
    @State var shapes: [Shape] = []
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Button("Add Shape"){
                        let x = Int.random(in: 0..<Int(geometry.size.width))
                        let y = Int.random(in: 0..<Int(geometry.size.height))
                        let id = UUID().uuidString
                        let newShape = Shape(id: id, position: CGPoint(x: x, y: y))
                        shapes.append(newShape)
                        let shapeIdx = shapes.count - 1
                        withAnimation(
                            Animation.linear.speed(2)
                        ){
                            shapes[shapeIdx].scale = 2.0
                        }
                    }
                }
                .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .center
                )
                ForEach(shapes){ shape in
                    Rectangle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shape.scale)
                        .position(shape.position)
                        .onTapGesture {
                            guard let idx = shapes.firstIndex(where: { $0.id == shape.id }) else { return }
                            withAnimation(
                                Animation.linear.speed(0.5)
                            ){
                                shapes[idx].scale = 0.0
                            }
                        }
                }
            }
            
        }
    }
}
