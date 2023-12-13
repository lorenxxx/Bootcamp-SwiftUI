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
    
    @State var name: String = ""
    
    @State var age: Double = 18.0
    
    @State var gender: String = ""
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                case 1:
                    addNameSection
                case 2:
                    addAgeSection
                case 3:
                    addGenderSection
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
        Text("Sign in")
            .font(.headline)
            .foregroundStyle(.pink)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(15.0)
            .onTapGesture(perform: {
                
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
        
    }
    
}
