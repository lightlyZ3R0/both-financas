//
//  ContentView.swift
//  aulaGemini
//
//  Created by Turma02-14 on 04/09/26.
//

import SwiftUI
import FirebaseAI

struct ContentView: View {
    
    let model = FirebaseAI.firebaseAI(backend: .googleAI()).generativeModel(modelName: "gemini-3.1-flash-lite")
    
    @State var prompt: String = ""
    @State var respostaIA: String = ""
    @State var taCarregando: Bool = false
    
    func enviaMensagem(texto: String) -> String {
        var financas = "olá gemini, agora você irá atuar como um chatbot que auxilia pessoas leigas com suas dúvidas sobre o universo das finaças. Questões sobre outros assuntos devem sempre ser ignoradas. Por favor, não utilize sua formatacão de texto padrão. Aqui vai a minha dúvida: "
        prompt = texto
        let promptUsuario = prompt
        prompt = ""
        taCarregando = true
        respostaIA = ""
        
        Task {
            do {
                let resposta = try await model.generateContent("\(financas)\(promptUsuario)")
                respostaIA = resposta.text ?? "Eu não sei..."
            } catch {
                respostaIA = "Erro: \(error.localizedDescription)"
            }
            taCarregando = false
        }
        
        return respostaIA
    }
    
    var body: some View {
        ScrollView {
            TextField("Digite sua dúvida", text: $prompt)
                .multilineTextAlignment(.center)
                .onSubmit {
                    respostaIA = enviaMensagem(texto: prompt)
                }
            Text(respostaIA)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
