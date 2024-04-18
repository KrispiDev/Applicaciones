//
//  ContentView.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import Combine
import SwiftUI

enum PomodoroState {
    case Empty, Playing, Paused
}

struct ViewSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ViewGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}

class ChangingWidth : ObservableObject {
    @Published var width : CGFloat = .zero
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var settings: SettingsWrapper
    @StateObject var viewModel = ViewModel()
    
    @Environment(\.scenePhase) var scenePhase
    @State var savedDate : Date = Date.now
    @State var savedRemaining : Int = 0
    
    
    @State var pomodoroState = PomodoroState.Empty
    @State var isCreationPresented : Bool = false
    
    @State var scrollText: Bool = false
    @ObservedObject var textWidth = ChangingWidth()
    @State var otherProp: CGFloat = .zero
    @State var offsetX: CGFloat = .zero
    let titleWidth: CGFloat = 350
    
    @State var showAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var alertConfirmAction : () -> Void = {}
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.offWhite
                VStack{
                    Header()
                    Counter(pomodoroState: $pomodoroState, viewModel: viewModel)
                    Spacer()
                    Spacer()
                    VStack(alignment: .center, spacing: 5){
                        if(pomodoroState == .Empty){
                            Text("¿Necesitas tiempo para trabajar?")
                                .font(.title2.bold())
                                .foregroundColor(.black.opacity(0.8))
                            Text("Cuando estés list@, haz clic en 'Más'.")
                                .font(.title3)
                                .foregroundColor(.gray)
                        } else {
                            Text(viewModel.currentSession.taskName)
                                .font(.title2.bold())
                                .foregroundColor(.black.opacity(0.8))
                            
                            Text(viewModel.currentSession.taskType.rawValue)
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    Spacer()
                    ButtonPad(pomodoroState: $pomodoroState, showCreation: {isCreationPresented = true}, showCancelAlert: showCancelAlert, changeRound: callChangeRound)
                    Spacer()
                }
                .padding()
                .transition(.slide)
            }
            .sheet(isPresented: $isCreationPresented){
                NavigationView{
                    CreateWorkView(pomodoroState: $pomodoroState, viewModel: viewModel)
                }
                
            }
            .alert(alertTitle, isPresented: $showAlert){
                Button("Confirmar", role: .none, action: alertConfirmAction)
                Button("Cancelar", role: .cancel, action: {})
            } message: {
                Text(alertMessage)
            }
            .onAppear{
                viewModel.delegate.requestAuthorization()
            }
            .onReceive(viewModel.timer){ _ in
                if(pomodoroState == .Playing && viewModel.currentSession.timeRemaining > 0){
                    withAnimation{
                        viewModel.currentSession.timeRemaining -= 1
                    }
                } else {
                    pomodoroState = .Paused
                    viewModel.changeRound(settings)
                }
            }
            .onChange(of: pomodoroState) { _ in
                if (pomodoroState == .Paused || pomodoroState == .Empty) {
                    viewModel.cancelTimer()
                } else {
                    viewModel.instantiateTimer(settings)
                }
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("active")
                    if(pomodoroState == .Playing)
                    {
                        let interval = Date.now.timeIntervalSinceReferenceDate - savedDate.timeIntervalSinceReferenceDate
                        
                        print("Interval", interval)
                        if(Int(interval) > savedRemaining) {
                            viewModel.currentSession.timeRemaining = 0
                        } else {
                            viewModel.currentSession.timeRemaining -= Int(interval)
                            viewModel.instantiateTimer(settings)
                        }
                       
                    }
                } else if newPhase == .background {
                    print("Background")
                    savedDate = Date.now
                    savedRemaining = viewModel.currentSession.timeRemaining
                } else if newPhase == .inactive {
                    print("Inactive")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationLink{
                        HistoryView()
                    } label: {
                        Image(systemName: "clock.arrow.circlepath")
                            .font(.title2)
                            .foregroundStyle(pomodoroState == .Empty ? LinearGradient(.purple, .pink) : LinearGradient(.gray) )
                    }
                    .disabled(pomodoroState != .Empty)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink{
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                            .font(.title2)
                            .foregroundStyle(pomodoroState == .Empty ? LinearGradient(.purple, .pink) : LinearGradient(.gray) )
                    }
                    .disabled(pomodoroState != .Empty)
                }
            }
            .background(Color.offWhite)
        }
        .preferredColorScheme(.light)
    }
    
    func callChangeRound() {
        viewModel.changeRound(settings)
    }
    
    func showCancelAlert() {
        alertMessage = "¿Te gustaría finalizar la tarea actual?"
        alertTitle = "Detener la tarea en curso"
        alertConfirmAction = {
            pomodoroState = .Empty
            Task {
                await saveSession()
                viewModel.currentSession = Session()
            }
        }
        showAlert = true
    }
    
    func saveSession() async {
        print("Guardar")
        let session = PomodoroSession(context: moc)
        session.task = viewModel.currentSession.taskName
        session.type = viewModel.currentSession.taskType.rawValue
        session.numberOfPomodoros = Int16(viewModel.currentSession.currentRound)
        session.numberOfRests = viewModel.currentSession.currentIntervalType == .rest ? Int16(viewModel.currentSession.currentRound) : Int16(viewModel.currentSession.currentRound - 1)
        session.pomodoroLength = Int16(viewModel.currentSession.basicPomodoroLength)
        session.restLenght = Int16(viewModel.currentSession.basicRestLength)
        print("Rest length: ", viewModel.currentSession.basicRestLength )
        session.restCadence = Int16(viewModel.currentSession.longRestCadence)
        session.longRestLength = Int16(viewModel.currentSession.longRestLength)
        session.date = Date.now
        
        print("Guardado")
        try? moc.save()
    }
}
    
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(savedDate: Date.now)
    }
}


