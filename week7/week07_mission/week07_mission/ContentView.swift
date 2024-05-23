import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 5) {
            TopView()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HStack(spacing: 20) {
                        Image("1_당근")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("[급구] 50만원 제공! 킁야 레스토랑에서 시식 알바 구합니다. ^^ - 🧅")
                                .font(.system(size: 17))
                            Text("당근알바 · 이벤트")
                                .font(.system(size: 14, weight: .thin))
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 20) {
                        Image("2_당근")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("에어팟맥스실버")
                                .font(.system(size: 17))
                            HStack {
                                Text("예약중")
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
                                    .background(Color(hex: "168D64"))
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                                Text("서울특별시 양천구 · 6일 전")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            Text("370,000원")
                                .font(.system(size: 17, weight: .bold))
                            HStack(alignment: .center, spacing: 5) {
                                Image(systemName: "message")
                                Text("5")
                                    .font(.system(size: 14, weight: .thin))
                                Image(systemName: "heart")
                                Text("23")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 20) {
                        Image("3_당근")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("에어팟 맥스 스페이스그레이 S급")
                                .font(.system(size: 17))
                            HStack {
                                Text("거래완료")
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
                                    .background(Color(hex: "168D64"))
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                                Text("서울특별시 양천구 · 3시간 전")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            Text("370,000원")
                                .font(.system(size: 17, weight: .bold))
                            
                            HStack(alignment: .center, spacing: 5) {
                                Image(systemName: "message")
                                Text("2")
                                    .font(.system(size: 14, weight: .thin))
                                Image(systemName: "heart")
                                Text("15")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }

                    Divider()
                    
                    HStack(spacing: 20) {
                        Image("4_당근")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("[S급] 에어팟 맥스 풀박 판매합니다")
                                .font(.system(size: 17))
                            Text("서울특별시 양천구 · 1일 전")
                                .font(.system(size: 14, weight: .thin))
                            Text("550,000원")
                                .font(.system(size: 17, weight: .bold))
                            
                            HStack(alignment: .center, spacing: 5) {
                                Image(systemName: "message")
                                Text("0")
                                    .font(.system(size: 14, weight: .thin))
                                Image(systemName: "heart")
                                Text("4")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 20) {
                        ScrollView(.horizontal) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("시원한 여름 간식의 계절 🍉🍧🍦")
                                    .font(.system(size: 18, weight: .bold))
                                
                                HStack(spacing : 20) {
                                    VStack(alignment: .leading) {
                                        Image("1_광고")
                                            .cornerRadius(10)
                                        Text("키친플라워")
                                            .font(.system(size: 17))
                                        Text("62,000원")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Image("2_광고")
                                            .cornerRadius(10)
                                        Text("얼음틀")
                                            .font(.system(size: 17))
                                        Text("1,000원")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Image("3_광고")
                                            .cornerRadius(10)
                                        Text("모양얼음틀")
                                            .font(.system(size: 17))
                                        Text("10,000원")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Image("4_광고")
                                            .cornerRadius(10)
                                        Text("실리콘얼음틀")
                                            .font(.system(size: 17))
                                        Text("5,000원")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Image("5_광고")
                                            .cornerRadius(10)
                                        Text("사각얼음틀")
                                            .font(.system(size: 17))
                                        Text("4,000원")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 20) {
                        Image("5_당근")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("에어팟 맥스 실버 S급")
                                .font(.system(size: 17))
                            HStack {
                                Text("예약중")
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
                                    .background(Color(hex: "168D64"))
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                                Text("서울특별시 양천구 · 1일 전")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            Text("600,000원")
                                .font(.system(size: 17, weight: .bold))
                            
                            HStack(alignment: .center, spacing: 5) {
                                Image(systemName: "message")
                                Text("6")
                                    .font(.system(size: 14, weight: .thin))
                                Image(systemName: "heart")
                                Text("11")
                                    .font(.system(size: 14, weight: .thin))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 20) {
                        Image("6_당근")
                            .cornerRadius(10)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("메가하이볼!!")
                                .font(.system(size: 17))
                            Text("광명동 · 추천소식")
                                .font(.system(size: 14, weight: .thin))
                        }
                    }
                }
                .padding()
            }
            

            Divider()
            BottomView()
        }
    }
}

#Preview {
    ContentView()
}
