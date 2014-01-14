# coding: utf-8

0.upto(9) do |idx|
  Article.create(title: "練習試合の結果#{idx}",
    body: "Morning Gloryが4対2でSunflowerに勝利。\n2回表、６番渡辺の２塁だから７番山田、８番高橋の連続タイムリーで２点先制。９回表、ランナー１，２類で２番田中の２塁だ出２点を挙げ、ダメを押しました。\n投げては初先発の山本が７回を２失点に抑え、伊藤、中村とつないで逃げ切りました。",
    released_at: 8.days.ago.advance(days: idx),
    expired_at: 2.days.ago.advance(days: idx),
    member_only: (idx % 3 == 0)
  )
end
