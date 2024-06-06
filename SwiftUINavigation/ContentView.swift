//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Olutayo on 6/6/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(articles) { article in
                    
                     ZStack{
                        ArticleRow(article: article)
                        NavigationLink(destination: ArticleDetailView(article:article) ){
                            EmptyView()
                            //ArticleRow(article: article)
                        }.opacity(0)
                    }
    
                    }.listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle("Your reading")
                
            }
        }
    }
    
    #Preview {
        ContentView()
    }
    
    struct ArticleRow: View {
        var article: Article
        
        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                
                Text(article.title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .lineLimit(3)
                    .padding(.bottom, 0)
                
                Text("By \(article.author)".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 0)
                
                HStack(spacing: 3) {
                    ForEach(1...(article.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(article.excerpt)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
        }
    }
    
    struct ArticleDetailView: View {
        var article: Article
        @Environment(\.dismiss) var dismiss
        var body: some View {
  
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading){
                        Image(article.image)
                            .resizable()
        //                    .frame(width: 300, height: 300)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        Group{
                            Text(article.title)
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.black)
                            
                            Text("By \(article.author)".uppercased())
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))

                        
                        HStack(spacing: 3) {
                            ForEach(1...(article.rating), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .font(.caption)
                                    .foregroundColor(.yellow)
                            }
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        
                        Text(article.excerpt)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                        
                        Text(article.content)
                            .font(.body)
                            .padding()
                            .lineLimit(1000)
                            .foregroundColor(.secondary)
                    }
                }.toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action:{
                            dismiss()
                        }){
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.largeTitle)
                        }.tint(.white)
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
             .navigationBarBackButtonHidden(true)
             .ignoresSafeArea(.all, edges: .top)
                
        }
    }
