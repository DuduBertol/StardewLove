//
//  DataModel.swift
//  Nano02
//
//  Created by Eduardo Bertol on 23/09/25.
//

import Foundation

struct Question: Identifiable, Hashable{
    var id: String
    
    var question: String
    
    var optionOne: String
    var optionOneTag: [Character]
    
    var optionTwo: String
    var optionTwoTag: [Character]
    
    var imageOne: String?
    var imageTwo: String?
    
    init(id: String, question: String, optionOne: String, optionOneTag: [Character]=[], optionTwo: String, optionTwoTag: [Character]=[], imageOne: String?=nil, imageTwo: String?=nil) {
        self.id = id
        self.question = question
        self.optionOne = optionOne
        self.optionOneTag = optionOneTag
        self.optionTwo = optionTwo
        self.optionTwoTag = optionTwoTag
        self.imageOne = imageOne
        self.imageTwo = imageTwo
    }
    
}

enum Character: String, CaseIterable {
    case abigail
    case alex
    case caroline
    case clint
    case dwarf
    case elliot
    case emily
    case gus
    case haley
    case harvey
    case krobus
    case leah
    case lewis
    case linus
    case maru
    case penny
    case sam
    case sebastian
    case shane
    case willy
    case wizard

    var name: String {
        switch self {
        case .abigail: return "Abigail"
        case .alex: return "Alex"
        case .caroline: return "Caroline"
        case .clint: return "Clint"
        case .dwarf: return "Dwarf"
        case .elliot: return "Elliot"
        case .emily: return "Emily"
        case .gus: return "Gus"
        case .haley: return "Haley"
        case .harvey: return "Harvey"
        case .krobus: return "Krobus"
        case .leah: return "Leah"
        case .lewis: return "Lewis"
        case .linus: return "Linus"
        case .maru: return "Maru"
        case .penny: return "Penny"
        case .sam: return "Sam"
        case .sebastian: return "Sebastian"
        case .shane: return "Shane"
        case .willy: return "Willy"
        case .wizard: return "Wizard"
        }
    }
}

extension Question {
    // Exemplo manual — todas as 20 perguntas preenchidas "na mao"
    static let allQuestions: [Question] = [
        Question(
            id: "q01",
            question: "Quem ganharia na mao?",
            optionOne: " Linus",
            optionOneTag: [.willy],
            optionTwo: " Willy",
            optionTwoTag: [.linus],
            imageOne: "LinusCharacter",
            imageTwo: "WillyCharacter"
        ),
        Question(
            id: "q02",
            question: "O que voce comeria no jantar?",
            optionOne: "Macarrao com Pedras",
            optionOneTag: [.abigail],
            optionTwo: "Pao Estranho",
            optionTwoTag: [.dwarf],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q03",
            question: "Uma bebida misteriosa...",
            optionOne: "Beber sem pensar duas vezes",
            optionOneTag: [.caroline, .wizard, .emily],
            optionTwo: "Dobrar e passar para o proximo",
            optionTwoTag: [.maru, .haley],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q04",
            question: "O que voce faria com uma Mimosa e um Narget?",
            optionOne: "Me deliciaria",
            optionOneTag: [.gus, .alex, .linus],
            optionTwo: "Faria uma pocao magica",
            optionTwoTag: [.abigail, .krobus, .wizard],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q05",
            question: "Quem voce expulsaria da vila?",
            optionOne: " Lewis",
            optionOneTag: [.clint],
            optionTwo: " Clint",
            optionTwoTag: [.lewis],
            imageOne: "LewisCharacter",
            imageTwo: "ClintCharacter"
        ),
        Question(
            id: "q06",
            question: "Quem eh mais performatico?",
            optionOne: " Sam",
            optionOneTag: [.elliot],
            optionTwo: " Elliot",
            optionTwoTag: [.sam],
            imageOne: "SamCharacter",
            imageTwo: "ElliotCharacter"
        ),
        Question(
            id: "q07",
            question: "O que voce pediria no Stardrop Sarloon",
            optionOne: "Eu nem frequento esse lugar",
            optionOneTag: [.maru, .alex],
            optionTwo: "Ceverja geladinha",
            optionTwoTag: [.shane, .clint],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q08",
            question: "Voce eh mais",
            optionOne: "do Rock",
            optionOneTag: [.sebastian, .sam],
            optionTwo: "Sossegadinho",
            optionTwoTag: [.penny, .harvey, .leah],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q09",
            question: "O que voce faria com a bermuda do prefeito?",
            optionOne: "Botar na sopa",
            optionOneTag: [.abigail],
            optionTwo: "Usar, mo estileira",
            optionTwoTag: [.emily],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q10",
            question: "Qual o melhor lugar para ficar de boa?",
            optionOne: "Na beira do penhasco",
            optionOneTag: [.shane],
            optionTwo: "No meio da floresta",
            optionTwoTag: [.wizard, .leah],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q11",
            question: "Para a sobremesa?",
            optionOne: "Chazinho",
            optionOneTag: [.caroline, .emily],
            optionTwo: "Moranguinho",
            optionTwoTag: [.maru],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q12",
            question: "Voce ganhou uma galinha...",
            optionOne: "Maionese e dinheiros",
            optionOneTag: [.gus, .lewis],
            optionTwo: "Nomes fofos",
            optionTwoTag: [.haley, .caroline],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q13",
            question: "Voce eh fa de evanescence?",
            optionOne: "Sim, sou emo",
            optionOneTag: [.sebastian],
            optionTwo: "nao...",
            optionTwoTag: [.penny],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q14",
            question: "Que flor eh mais bonita?",
            optionOne: " Girassol",
            optionOneTag: [.haley],
            optionTwo: " Rosa de fada",
            optionTwoTag: [.penny],
            imageOne: "Girassol",
            imageTwo: "RosaDeFada"
        ),
        Question(
            id: "q15",
            question: "Com que objeto voce se identifica?",
            optionOne: " Boneco estranho do neymar",
            optionOneTag: [.alex, .harvey],
            optionTwo: " Omnigeodo",
            optionTwoTag: [.clint, .krobus, .dwarf],
            imageOne: "BonecoNeymar",
            imageTwo: "Omnigeodo"
        ),
        Question(
            id: "q16",
            question: "Que animal voce seria?",
            optionOne: " Galinha azul",
            optionOneTag: [.shane],
            optionTwo: " Avestruz",
            optionTwoTag: [.elliot],
            imageOne: "GalinhaAzul",
            imageTwo: "Avestruz"
        ),
        Question(
            id: "q17",
            question: "Qual o chapeu mais daora?",
            optionOne: " Chapeu de coletor",
            optionOneTag: [.caroline, .leah],
            optionTwo: " Chapeu de pirata de luxo",
            optionTwoTag: [.willy],
            imageOne: "ChapeuColetor",
            imageTwo: "ChapeuPirata"
        ),
        Question(
            id: "q18",
            question: "Fazenda serve para...",
            optionOne: "Deixar bonita",
            optionOneTag: [.elliot],
            optionTwo: "Ficar rico",
            optionTwoTag: [.lewis],
            imageOne: nil,
            imageTwo: nil
        ),
        Question(
            id: "q19",
            question: "Que peixe voce esta se sentindo hoje?",
            optionOne: " Truta arco iris",
            optionOneTag: [.gus, .harvey],
            optionTwo: " Peixe bolha",
            optionTwoTag: [.linus, .willy],
            imageOne: "PeixeTruta",
            imageTwo: "PeixeBolha"
        ),
        Question(
            id: "q20",
            question: "Qual o mob mais daora?",
            optionOne: " Gosma perigosa",
            optionOneTag: [.sebastian, .sam],
            optionTwo: " Morcego de iridio",
            optionTwoTag: [.krobus, .dwarf],
            imageOne: "GosmaPerigosa",
            imageTwo: "MorcegoDeIridio"
        )
    ]
}

