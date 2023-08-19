import SwiftUI

struct ContentView: View {
    @State private var labelText: String = ""
    @State private var fontSize: CGFloat = 16.0

    // 例としての二次元配列
    let charList: [[String]] = [
        ["あ", "い", "う", "え", "お"],
        ["か", "き", "く", "け", "こ"],
        ["さ", "し", "す", "せ", "そ"],
        ["た", "ち", "つ", "て", "と"],
        ["な", "に", "ぬ", "ね", "の"],
        ["は", "ひ", "ふ", "へ", "ほ"],
        ["ま", "み", "む", "め", "も"],
        ["や", "", "ゆ", "", "よ"],
        ["ら", "り", "る", "れ", "ろ"],
        ["わ", "", "を", "", "ん"]
    ]

    let symbolList = ["1", "2", "3", "4", "5", "6", " 7", "8", "9", "0"]

    var body: some View {
        VStack(spacing: 20) {
            // Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(width: .infinity, height: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2) // 縁の色と太さを指定
                        )
                    Text(labelText == "" ? "テキストを入力" : labelText)
                        .font(.system(size: fontSize))
                        .padding()
                }
                VStack {
                    Button(action: {
                        fontSize += 2
                    }) {
                        Text("文字\n大") // Textビューを明示的に使用
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    .cornerRadius(8.0)
                    Slider(value: $fontSize, in: 10 ... 100, step: 1)
                        .frame(width: 20, height: 100)
                        .rotationEffect(.degrees(90))
                        .padding()
                    Button(action: {
                        fontSize -= 2
                    }) {
                        Text("文字\n小") // Textビューを明示的に使用
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    .cornerRadius(8.0)
                }
            }
            Spacer()
            // キー配列
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: 5) {
                        // 二次元配列を基にしたボタン群
                        ForEach(symbolList, id: \.self) { title in
                            Button(action: {
                                labelText += title
                            }) {
                                Text(title == "" ? "　" : title) // Textビューを明示的に使用
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .frame(width: (geometry.size.width - 50) / CGFloat(charList.count), height: geometry.size.width / CGFloat(charList.count + 1)) // 正方形のサイズを計算
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8.0)
                        }
                    }
                    .frame(width: .infinity, height: .infinity)
                    HStack(spacing: 5) {
                        // 二次元配列を基にしたボタン群
                        ForEach(charList.indices.reversed(), id: \.self) { rowIndex in
                            VStack(spacing: 5) {
                                ForEach(charList[rowIndex], id: \.self) { title in
                                    Button(action: {
                                        labelText += title
                                    }) {
                                        Text(title == "" ? "　" : title) // Textビューを明示的に使用
                                            .font(.title)
                                            .fontWeight(.bold)
                                    }
                                    .frame(width: (geometry.size.width - 50) / CGFloat(charList.count), height: geometry.size.width / CGFloat(charList.count + 1)) // 正方形のサイズを計算
                                    .background(rowIndex % 2 == 0 ? Color.blue : Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                                }
                                Spacer()
                            }
                            .frame(width: .infinity, height: .infinity)
                        }
                    }
                    .frame(width: .infinity, height: .infinity)
                }
            }
            .edgesIgnoringSafeArea(.all) // 画面全体に拡大
            HStack {
                Button(action: {
                    // ボタンがタップされたときのアクション
                    print("再生ボタンがタップされました")
                }) {
                    Image(systemName: "play.fill") // 再生ボタンのシステムアイコン
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding()
                .font(.title)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8.0)
                Button(action: {
                    labelText = ""
                }) {
                    Image(systemName: "xmark") // 再生ボタンのシステムアイコン
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding()
                .font(.title)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8.0)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
