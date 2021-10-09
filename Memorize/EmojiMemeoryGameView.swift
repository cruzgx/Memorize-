//
//  ContentView.swift
//  Memorize
//
//  Created by Cruz Gonzalez Garcia on 8/25/21.
//

import SwiftUI



/* A struct is like a class but that can't pass on it's inheritance */
struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
//            ScrollView{
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
//                    ForEach(viewModel.cards) { card in
        aspectRatio(items: viewModel.cards, aspectRatio: 2/3, content: {card in
            CardView(card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    viewModel.choose(card)
                }
        })
        
                        
//                    }
//                }
//            }
            .foregroundColor(.red)
            .padding(.horizontal)
  }
}





struct CardView: View {
 
    var card: MemoryGame<String>.Card
    
    init(_ card:  MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        
        GeometryReader(content: {geometry in
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: DrawingConstant.lineWidth)
                Text(card.content).font(font(in: geometry.size))
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
                    .fill()
            }
        }
    })
        
        
        
  }
    private func font(in size: CGSize ) -> Font {
        Font.system(size: min(size.width,size.height) * DrawingConstant.fontScale)
    }
    
    private struct DrawingConstant {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}



























//this just allows for the preview to able to displayed on the right
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame
        
        ContentView(viewModel: game).preferredColorScheme(.dark)
        ContentView(viewModel: game).preferredColorScheme(.light)
        
    }
}
