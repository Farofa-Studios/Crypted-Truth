//
//  SubtitlesService.swift
//  CryptedTruth
//
//  Created by Ana Kiara Medeiros Braga on 16/02/23.
//

import Foundation

struct MiniGameSubtitles {
    
    static let allMiniGameSubtitles: [MiniGameSubtitle] = [
        
        // minigame audição
        
        .init(instructions: .init(id: 0, image: "Bot", type: .villain, subtitle: "Deslize para o lado que corresponde ao som na ordem em que escutar... Memorize e reproduza a sequência de sons sem errar para liberar mais informações do caso."),
              hit: nil,
              lastHist: nil,
              error: .init(id: 1, image: "sophia-chocada", type: .streamer, subtitle: "Aahh! Errei a sequência... Vou ter que recomeçar!"),
              completedWithError: .init(id: 2, image: "sophia-chocada", type: .streamer, subtitle: "Ufa! Foi difícil, mas conseguimos!"),
              completedWithoutError: .init(id: 3, image: "sophia-animada", type: .streamer, subtitle: "Ah gente, achei fácil!"),
              completed: .init(id: 4, image: "sophia-animada", type: .streamer, subtitle: "Terminamos o desafio e liberamos as informações dessa vítima! Vamos dar uma olhada no quadro.")
             ),
        
        // minigame tato
        
            .init(instructions: .init(id: 5, image: "Bot", type: .villain, subtitle: "Deslize entre as peças e clique para rotacionar até formar a imagem completa."),
                  hit: .init(id: 6, image: "sophia-animada", type: .streamer, subtitle: "Conseguimos! Olha só a imagem completa, é linda! Acho que são vasos de cerâmia."),
                  lastHist: nil,
                  error: nil,
                  completedWithError: nil,
                  completedWithoutError: nil,
                  completed: .init(id: 7, image: "sophia-animada", type: .streamer, subtitle: "Perfeito! Vamos ver lá no quadro as novas informações.")
                 ),
        
        
        // minigame paladar
        
            .init(instructions: .init(id: 8, image: "Bot", type: .villain, subtitle: "Selecione o ingrediente que falta para completar a receita."),
                  hit: .init(id: 9, image: "sophia-animada", type: .streamer, subtitle: "Isso! Ingrediente certo! Vamos para a próxima."),
                  lastHist: .init(id: 10, image: "sophia-animada", type: .streamer, subtitle: "Isso! Conseguimos!"),
                  error: .init(id: 11, image: "sophia-concentrada", type: .streamer, subtitle: "Ah não, não era esse ingrediente! Hmmm... Então deve ser..."),
                  completedWithError: nil,
                  completedWithoutError: nil,
                  completed: .init(id: 12, image: "sophia-animada", type: .streamer, subtitle: "Conseguimos! Depois dessa, já posso até virar chef de cozinha! Vamos voltar ao quadro de evidências pra ver o que desbloqueamos.")
                 ),
        
        
        // minigame olfato
        
            .init(instructions: .init(id: 13, image: "Bot", type: .villain, subtitle: "Selecione o item que falta para completar o conjunto de cheiros."),
                  hit: .init(id: 14, image: "sophia-animada", type: .streamer, subtitle: "Isso! Odor correto! Vamos para a próxima."),
                  lastHist: .init(id: 15, image: "sophia-animada", type: .streamer, subtitle: "Isso! Conseguimos!"),
                  error: .init(id: 16, image: "sophia-concentrada", type: .streamer, subtitle: "Ah não, não era isso! Hmmm... Então deve ser..."),
                  completedWithError: nil,
                  completedWithoutError: nil,
                  completed: .init(id: 17, image: "sophia-animada", type: .streamer, subtitle: "Depois dessa, a minha rinite veio com tudo! Vamos voltar ao quadro de evidências pra ver o que desbloqueamos.")
                 )
    ]
}

