//
//  TweetsViewModel.swift
//  twitterClone
//
//  Created by Darío Gallegos on 27/6/22.
//

import Foundation

enum TweetType: Int {
    case text
    case image
    case video
    case gif
}

struct Tweet: Identifiable {
    var id = UUID()
    var username: String = ""
    var nickname: String = ""
    var imageProfile: String = ""
    var date: String = ""
    var tweetType: TweetType = .text
    var showTheard: Bool = false
    var message: String = ""
    var imagesFile: [String] = []
    var videoFile: String = ""
}

struct TweetsList {
    var list: [Tweet] = []
    
    init() {
        list.append(Tweet(username: "National Geographic", nickname: "@NatGeo", imageProfile: "national", date: "10m", tweetType: .video, showTheard: false, message: "Los leones marinos de Steller son cazadores marinos muy hábiles y oportunistas. Habitando las frías aguas árticas del Océano Pacífico Norte, se aprovechan de una amplia gama de especies de peces, como salmón, fletán y bacalao", imagesFile: [], videoFile: "seal"))
        list.append(Tweet(username: "dariogallegos", nickname: "@gallegos_dario", imageProfile: "dario", date: "3h", tweetType: .text, showTheard: true, message: "El show *#Payaso* de *@franco_escamilla* me dejo llorando durante dos. Super recomendado porque es terapia para y para nosotros felicidades!!!. Gran trabajo. Esperemos que pronto vuelva pronto y repita en *#Madrid.*", imagesFile: [], videoFile: ""))
        list.append(Tweet(username: "miris", nickname: "@lweelmiri", imageProfile: "miri", date: "5h", tweetType: .image, showTheard: true, message: "Es impresionante como las pinturas de *@hyunjin* me pueden causar generar tanta emocion, es algo que no muchas personas logran a la hora de hacer algo como esto, y el fecho de lo haga, me hace sentir tan orgullosa de el <3", imagesFile: ["art1", "art2", "art3", "art4"], videoFile: ""))
        list.append(Tweet(username: "Jota", nickname: "@JotaPictures", imageProfile: "jota", date: "Ayer", tweetType: .image, showTheard: false, message: "*@NaturPictures*: Espectaculares campos de arroz en China.", imagesFile: ["rise"], videoFile: ""))
        list.append(Tweet(username: "Daniela Garay", nickname: "@DanniGar", imageProfile: "daniela", date: "Ayer", tweetType: .image, showTheard: true, message: "En el *#DíaMundialDeLaBicicleta*, *#ElBancoDeTodos* promueve su uso y te invita a ser parte del cambio. 💪🏻 ¡Por una ciudad con aire limpio y más espacio para movilizarnos! 🚴‍♀🚴‍♂", imagesFile: ["cicle1","cicle2","cicle3"], videoFile: ""))
    }
}
