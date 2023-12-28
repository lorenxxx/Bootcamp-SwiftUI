//
//  OnboardingView.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/13.
//

import SwiftUI

struct OnboardingView: View {
    
    /*
     Onboarding States
     
     0 - Welcome Screen
     1 - Add Name
     2 - Add Age
     3 - Add Gender
     */
    @State var onboardingState: Int = 0
    
    // onborading input
    @State var name: String = ""
    
    @State var age: Double = 18.0

    @State var gender: String = "Male"
    
    // transition
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    // for the alert
    @State var alertTitle: String = ""
    
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    @AppStorage("name") var currentUserName: String?
    
    @AppStorage("age") var currentUserAge: Int?
    
    @AppStorage("gender") var currentUserGender: String?
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 15.0)
                        .foregroundStyle(.green)
                }
            }
            
            // button
            VStack {
                Spacer()
                bottomButton
            }
            .padding()
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
    
}

#Preview {
    OnboardingView()
        .background(
            RadialGradient(
                colors: [.yellow, .pink],
                center: .topLeading,
                startRadius: 0,
                endRadius: UIScreen.main.bounds.height
            )
        )
}

// MARK: COMPONENTS
extension OnboardingView {
    
    private var bottomButton: some View {
        Text(
            onboardingState == 0 ? "SIGN UP" :
                onboardingState == 3 ? "FINISH" : "NEXT"
        )
            .font(.headline)
            .foregroundStyle(.pink)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(15.0)
            .onTapGesture(perform: {
                handleNextButtonPressed()
            })
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Text("Find your match")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5.0)
                        .foregroundStyle(.white)
                }
            
            Text("This is a demo created by Loren, which to practise SwiftUI skills.")
                .fontWeight(.medium)
                .foregroundStyle(.white)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
        
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(15.0)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
        
            Text("What's your age?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
            
            Slider(
                value: $age,
                in: 0...150,
                step: 1
            )
            //.accentColor(.white)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
        
            Text("What's your gender?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Picker("Picker", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            }
            .pickerStyle(.wheel)
            .foregroundStyle(.blue)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }

}


// MARK: FUNCTIONS
extension OnboardingView {
    
    func handleNextButtonPressed() {
        // check input
        switch onboardingState {
        case 1:
            guard name.count > 3 else {
                showAlert(title: "Your name must be at least 3 characters long! ")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward! ")
                return
            }
        default:
            break
        }
        
        // go to next section
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring) {
                onboardingState += 1
            }
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        
        withAnimation(.spring) {
            currentUserSignedIn = true
        }
        
    }
    
}
