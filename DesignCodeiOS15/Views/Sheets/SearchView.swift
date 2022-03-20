//
//  SearchView.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 09.03.2022.
//

import SwiftUI

struct SearchView: View {
  @State var text = ""
  @State var show = false
  @Namespace var namespace
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          content
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .background(
          Rectangle()
            .fill(.regularMaterial)
            .frame(height: 200)
            .frame(maxHeight: .infinity, alignment: .top)
            .blur(radius: 20)
            .offset(y: -200)
        )
        .background(
          Image("Blob 1").offset(x: -100, y: -200)
        )
      }
      .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design")) {
        ForEach(suggestions) { suggestion in
          Button {
            text = suggestion.text
          } label: {
            Text(suggestion.text)
              .searchCompletion(suggestion.text)
          }
        }
      }
      
      .navigationTitle("Search")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Done").bold() })
    }
  }
  
  var content: some View {
    ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
      Button {
        show = true
      } label: {
        HStack(alignment: .top, spacing: 12) {
          Image(item.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 44, height: 44)
            .background(Color("Background"))
            .mask(Circle())
          VStack(alignment: .leading, spacing: 4) {
            Text(item.title).bold()
            Text(item.text)
              .font(.footnote)
              .foregroundColor(.secondary)
              .frame(maxWidth: .infinity, alignment: .leading)
              .multilineTextAlignment(.leading)
          }
        }
        .padding(.vertical, 4)
        .listRowSeparator(.hidden)
      }
      .sheet(isPresented: $show) {
        CourseView(namespace: namespace, course: courses[1], show: $show)
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}

//$0.title.hasPrefix(text) поиск следует порядку написания
