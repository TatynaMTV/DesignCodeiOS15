//
//  SignUpView.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 19.03.2022.
//

import SwiftUI

struct SignUpView: View {
  enum Field: Hashable {
    case email
    case password
  }
  
  @State var email = ""
  @State var password = ""
  @FocusState var focusedField: Field?
  @State var circleY: CGFloat = 120
  @State var emailY: CGFloat = 0
  @State var passwordY: CGFloat = 0
  @State var circleColor: Color = .blue
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Sign up")
        .font(.largeTitle).bold()
      Text("Access 120+ hours of courses, tutorials and livestreams")
        .font(.headline)
      TextField("Email", text: $email)
        .inputStyle(icon: "mail")
        .textContentType(.emailAddress)
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .focused($focusedField, equals: .email)
        .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
        .overlay(geometry)
        .onPreferenceChange(CirclePreferenceKey.self) { value in
          emailY = value
          circleY = value
        }
      SecureField("Password", text: $password)
        .inputStyle(icon: "lock")
        .textContentType(.password)
        .focused($focusedField, equals: .password)
        .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
        .overlay(geometry)
        .onPreferenceChange(CirclePreferenceKey.self, perform: { value in
          passwordY = value
      })
      Button {} label: {
        Text("Create an account")
          .frame(maxWidth: .infinity)
      }
      .font(.headline)
      .blendMode(.overlay)
      .buttonStyle(.angular)
      .tint(.accentColor)
      .controlSize(.large)
      
      Group {
        Text("By clicking on")
        + Text("__Create an account__").foregroundColor(.primary.opacity(0.7))
        + Text(", you agree to our **Terms of service** and **[Privacy policy](https://developer.apple.com)**")
        
        Divider()
        
        HStack {
          Text("Already have an account?")
          Button {} label: {
            Text("**Sign in**")
          }
        }
      }
      .font(.footnote)
      .foregroundColor(.secondary)
      .accentColor(.secondary)
    }
    .padding(20)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .coordinateSpace(name: "container")
    .strokeStyle(cornerRadius: 30)
    .background(
      Circle().fill(circleColor)
        .frame(width: 68, height: 68)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .offset(y: circleY)
    )
    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
    .padding(20)
    .background(
      Image("Blob 1").offset(x: 200, y: -100)
    )
    .onChange(of: focusedField) { value in
      withAnimation {
        if value == .email {
          circleY = emailY
          circleColor = .blue
        } else {
          circleY = passwordY
          circleColor = .red
        }
      }
    }
  }
  
  var geometry: some View {
    GeometryReader { proxy in
      Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SignUpView()
        .preferredColorScheme(.light)
    }
  }
}
