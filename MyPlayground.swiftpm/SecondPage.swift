import SwiftUI

struct Shape {
    var position: CGPoint
    var scale: CGFloat
}

struct SecondPage: View {
    @State var shapes: [Shape] = []
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Button("Add Shape"){
                        let newShape = Shape(
                            position: CGPoint(
                                x: Int.random(in: 0...Int(geometry.size.width)),
                                y: Int.random(in: 0...Int(geometry.size.height))
                            ),
                            scale: 0.0
                        )
                        shapes.append(newShape)
                        withAnimation(Animation.easeInOut(duration: 0.5)){
                            shapes[shapes.count-1].scale = 1.0
                        }
                    }
                }
                ForEach((0..<shapes.count), id: \.self) { idx in
                    Rectangle()
                        .fill(.red)
                        .frame(width: 40, height: 40)
                        .scaleEffect(shapes[idx].scale)
                        .position(shapes[idx].position)
                        .onTapGesture {
                            withAnimation(Animation.easeInOut(duration: 1)){
                                shapes[idx].scale = 0
                            }
                        }
                }
            }
        }
    }
}
